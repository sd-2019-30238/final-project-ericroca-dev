//
//  UserBookingTableViewController.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 07/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit
import Firebase

class UserBookingTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var roomLabel: UILabel!
    @IBOutlet var roomPriceLabel: UILabel!
    
    @IBOutlet var jacuzziLabel: UILabel!
    @IBOutlet var swimmingLabel: UILabel!
    @IBOutlet var mealLabel: UILabel!
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    // MARK: - Properties
    
    var booking: Booking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomLabel.text = String(booking!.room)
        roomPriceLabel.text = String(format: "%.0f", booking!.roomPrice) + " lei"
        
        if booking!.hasJacuzzi {
            jacuzziLabel.text = "+50 lei"
        } else {
            jacuzziLabel.text = "N/A"
        }
        
        if booking!.hasSwimming {
            swimmingLabel.text = "+15 lei"
        } else {
            swimmingLabel.text = "N/A"
        }
        
        if booking!.hasMeal {
            mealLabel.text = "+30 lei"
        } else {
            mealLabel.text = "N/A"
        }
        
        totalPriceLabel.text = String(format: "%.0f", booking!.totalPrice) + " lei"
        
        roomLabel.sizeToFit()
        roomPriceLabel.sizeToFit()
        jacuzziLabel.sizeToFit()
        swimmingLabel.sizeToFit()
        mealLabel.sizeToFit()
        totalPriceLabel.sizeToFit()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
