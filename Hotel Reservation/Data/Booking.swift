//
//  Booking.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 05/06/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit

struct Booking {
    
    // MARK: - Properties
    
    var user: String
    var room: Int
    var hasJacuzzi: Bool
    var hasSwimming: Bool
    var hasMeal: Bool
    var roomPrice: Double
    var totalPrice: Double
    
    // MARK: - Initialization
    
    init?(user: String, room: Int, hasJacuzzi: Bool, hasSwimming: Bool, hasMeal: Bool, roomPrice: Double, totalPrice: Double) {
        
        // The user ID must not be empty
        guard !user.isEmpty else {
            return nil
        }
        
        // The room number must be positive
        guard room > 0 else {
            return nil
        }
        
        // The room price must be positive
        guard roomPrice > 0 else {
            return nil
        }
        
        // The total price must be positive
        guard totalPrice > 0 else {
            return nil
        }
        
        self.user = user
        self.room = room
        self.hasJacuzzi = hasJacuzzi
        self.hasSwimming = hasSwimming
        self.hasMeal = hasMeal
        self.roomPrice = roomPrice
        self.totalPrice = totalPrice
    }
}
