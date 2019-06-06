//
//  BookingTableViewCell.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 05/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var roomLabel: UILabel!

    func populate(booking: Booking) {
        roomLabel.text = "Room " + String(booking.room)
    }
}
