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
    
    // MARK: - Initialization
    
    init?(user: String, room: Int, hasJacuzzi: Bool, hasSwimming: Bool, hasMeal: Bool) {
        
        // The user ID must not be empty
        guard !user.isEmpty else {
            return nil
        }
        
        // The room number must be positive
        guard room > 0 else {
            return nil
        }
        
        self.user = uesr
        self.room = room
        self.hasJacuzzi = hasJacuzzi
        self.hasSwimming = hasSwimming
        self.hasMeal = hasMeal
    }
}
