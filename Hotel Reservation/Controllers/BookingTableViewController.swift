//
//  BookingTableViewController.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 05/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit
import Firebase

class BookingTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var bookings = [Booking]()
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
        
        loadBookingsFromFirestore()
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BookingTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BookingTableViewCell else {
            fatalError("The dequeued cell is not an instance of BookingTableViewCell.")
        }
        
        let booking: Booking
        
        // Fetches the appropriate booking for the data source layout
        booking = bookings[indexPath.row]
        
        cell.populate(booking: booking)
        
        // Make labels dynamically change width based on text length
        // Must be applied after text change
        cell.roomLabel.sizeToFit()
        
        return cell
    }
    
    // MARK: - Private Methods
    
    private func loadBookingsFromFirestore() {
        var objFetched = 0
        db!.collection("bookings").whereField("user", isEqualTo: Auth.auth().currentUser!.uid).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let user = document.get("user") as! String
                    let room = document.get("room") as! Int
                    let hasJacuzzi = document.get("hasJacuzzi") as! Bool
                    let hasSwimming = document.get("hasSwimming") as! Bool
                    let hasMeal = document.get("hasMeal") as! Bool
                    
                    let booking = Booking(user: user, room: room, hasJacuzzi: hasJacuzzi, hasSwimming: hasSwimming, hasMeal: hasMeal)
                    
                    self.bookings.append(booking!)
                    self.tableView.reloadData()
                    
                    objFetched += 1
                    
                    if objFetched == self.bookings.count {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
