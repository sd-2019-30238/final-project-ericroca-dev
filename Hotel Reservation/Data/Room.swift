//
//  Room.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 30/05/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit

struct Room {
    
    // MARK: - Properties
    
    var number: Int
    var type: String
    var price: Double
    var isAvailable: Bool
    
    // MARK: - Initialization
    
    init?(number: Int, type: String, price: Double, isAvailable: Bool) {
        
        // The number must be positive
        guard number > 0 else {
            return nil
        }
        
        // The type must not be empty
        guard !type.isEmpty else {
            return nil
        }
        
        // The price must be positive
        guard price > 0 else {
            return nil
        }
        
        self.number = number
        self.type = type
        self.price = price
        self.isAvailable = isAvailable
    }
}
