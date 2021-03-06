//
//  AccommodationsTableViewController.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 06/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit

class AccommodationsTableViewController: UITableViewController {

    // MARK: - Outlets
    
    @IBOutlet var jacuzziSwitch: UISwitch!
    @IBOutlet var swimmingSwitch: UISwitch!
    @IBOutlet var mealSwitch: UISwitch!
    
    // MARK: - Properties
    
    var room: Room?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        
        if segue.identifier == "ShowBookingDetails" {
            guard let bookingDetailsTableViewController = segue.destination as? BookingDetailsTableViewController else {
                fatalError("Unexpected destination: \(segue.destination).")
            }
            
            bookingDetailsTableViewController.room = self.room
            bookingDetailsTableViewController.hasJacuzzi = jacuzziSwitch.isOn
            bookingDetailsTableViewController.hasSwimming = swimmingSwitch.isOn
            bookingDetailsTableViewController.hasMeal = mealSwitch.isOn
        }
    }

}
