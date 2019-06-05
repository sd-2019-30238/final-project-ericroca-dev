//
//  Room.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 30/05/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit

class Room {
    
    //MARK: Properties
    
    var number: Int
    var type: String
    var price: Double
    var hasJacuzzi: Bool
    var hasSwimming: Bool
    var hasMeal: Bool
    
    //MARK: Initialization
    
    init?(number: Int, type: String, price: Double, hasJacuzzi: Bool, hasSwimming: Bool, hasMeal: Bool) {
        
        // Number must be positive
        guard number > 0 else {
            return nil
        }
        
        // Type must not be empty
        guard !type.isEmpty else {
            return nil
        }
        
        // Price must be positive
        guard price > 0 else {
            return nil
        }
        
        self.number = number
        self.type = type
        self.price = price
        self.hasJacuzzi = hasJacuzzi
        self.hasSwimming = hasSwimming
        self.hasMeal = hasMeal
    }
}
