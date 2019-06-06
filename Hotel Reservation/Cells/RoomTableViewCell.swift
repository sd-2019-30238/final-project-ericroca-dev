//
//  RoomTableViewCell.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 05/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func populate(room: Room) {
        numberLabel.text = "Room " + String(room.number)
        typeLabel.text = room.type
        priceLabel.text = String(format: "%.0f", room.price) + " lei"
    }
}
