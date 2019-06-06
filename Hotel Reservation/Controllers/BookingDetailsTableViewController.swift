//
//  BookingDetailsTableViewController.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 06/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit
import Firebase

class BookingDetailsTableViewController: UITableViewController {

    // MARK: - Outlets
  
    @IBOutlet var roomLabel: UILabel!
    @IBOutlet var roomPriceLabel: UILabel!
    
    @IBOutlet var jacuzziLabel: UILabel!
    @IBOutlet var swimmingLabel: UILabel!
    @IBOutlet var mealLabel: UILabel!
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    // MARK: - Properties
    var room: Room?
    var hasJacuzzi: Bool?
    var hasSwimming: Bool?
    var hasMeal: Bool?
    var totalPrice: Double?
    
    var storage: Storage?
    var storageRef: StorageReference?
    var db: Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalPrice = room!.price
        
        roomLabel.text = String(room!.number)
        roomPriceLabel.text = String(format: "%.0f", room!.price) + " lei"
        
        if hasJacuzzi! {
            jacuzziLabel.text = "+50 lei"
            totalPrice! += 50
        } else {
            jacuzziLabel.text = "N/A"
        }
        
        if hasSwimming! {
            swimmingLabel.text = "+15 lei"
            totalPrice! += 15
        } else {
            swimmingLabel.text = "N/A"
        }
        
        if hasMeal! {
            mealLabel.text = "+30 lei"
            totalPrice! += 30
        } else {
            mealLabel.text = "N/A"
        }
        
        totalPriceLabel.text = String(format: "%.0f", totalPrice!) + " lei"
        
        roomLabel.sizeToFit()
        roomPriceLabel.sizeToFit()
        jacuzziLabel.sizeToFit()
        swimmingLabel.sizeToFit()
        mealLabel.sizeToFit()
        totalPriceLabel.sizeToFit()
        
        // Get a reference to the storage service using the default Firebase App
        storage = Storage.storage()
        
        // Create a storage reference from our storage service
        storageRef = storage!.reference()
        
        // Firebase Cloud Firestore initialization
        db = Firestore.firestore()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 1
        default:
            return 0
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the Done button is pressed.
        guard let button = sender as? UIBarButtonItem, button === doneButton else {
            fatalError("The Done button was not pressed, cancelling.")
        }
        
        let booking = Booking(user: Auth.auth().currentUser!.uid,  room: room!.number, hasJacuzzi: self.hasJacuzzi!, hasSwimming: self.hasSwimming!, hasMeal: self.hasMeal!, roomPrice: room!.price, totalPrice: totalPrice!)
        
        db!.collection("bookings").document().setData([
            "user": booking!.user,
            "room": booking!.room,
            "hasJacuzzi": booking!.hasJacuzzi,
            "hasSwimming": booking!.hasSwimming,
            "hasMeal": booking!.hasMeal,
            "roomPrice": booking!.roomPrice,
            "totalPrice": booking!.totalPrice
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
