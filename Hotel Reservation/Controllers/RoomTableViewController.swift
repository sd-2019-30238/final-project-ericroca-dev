//
//  ViewController.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 30/05/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

class RoomTableViewController: UITableViewController, FUIAuthDelegate {

    // MARK: - Properties
    var rooms = [Room]()
    var storage: Storage?
    var storageRef: StorageReference?
    var db: Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Eliminate empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Get a reference to the storage service using the default Firebase App
        storage = Storage.storage()
        
        // Create a storage reference from our storage service
        storageRef = storage!.reference()
        
        // Firebase Cloud Firestore initialization
        db = Firestore.firestore()
        
        loadRoomsFromFirestore()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            //do something :D
        } else {
            let authUI = FUIAuth.defaultAuthUI()
            authUI?.delegate = self
            let providers: [FUIAuthProvider] = [
                FUIEmailAuth(),
            ]
            
            authUI?.providers = providers
            let authViewController = authUI!.authViewController()
            self.present(authViewController, animated: true, completion: nil)
        }
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RoomTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RoomTableViewCell else {
            fatalError("The dequeued cell is not an instance of RoomTableViewCell.")
        }
        
        let room: Room
        
        // Fetches the appropriate room for the data source layout
        room = rooms[indexPath.row]
        
        cell.populate(room: room)
        
        // Make labels dynamically change width based on text length
        // Must be applied after text change
        cell.numberLabel.sizeToFit()
        cell.typeLabel.sizeToFit()
        cell.priceLabel.sizeToFit()
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "ChooseAccommodations" {
            guard let accommodationsTableViewController = segue.destination as? AccommodationsTableViewController else {
                fatalError("Unexpected destination: \(segue.destination).")
            }
                    
            guard let selectedRoomCell = sender as? RoomTableViewCell else {
                fatalError("Unexpected sender: \(sender).")
            }
                    
            guard let indexPath = tableView.indexPath(for: selectedRoomCell) else {
                fatalError("The selected cell is not being displayed by the table.")
            }
                    
            let selectedRoom: Room
                    
            selectedRoom = rooms[indexPath.row]
                    
            print("Selected: \(selectedRoom.price)")
                    
            accommodationsTableViewController.room = selectedRoom
        }
    }
    
    // MARK: - FirebaseUI
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // Handle user returning from authenticating
    }
    
    // MARK: - Actions
    
    @IBAction func unwindToRoomList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? BookingDetailsTableViewController {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Private Methods
    
    private func loadRoomsFromFirestore() {
        var objFetched = 0
        db!.collection("rooms").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let number = document.get("number") as! Int
                    let type = document.get("type") as! String
                    let price = document.get("price") as! Double
                    
                    let room = Room(number: number, type: type, price: price)
                    
                    self.rooms.append(room!)
                    self.tableView.reloadData()
                    
                    objFetched += 1
                    
                    if objFetched == self.rooms.count {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
