//
//  Hotel_ReservationTests.swift
//  Hotel ReservationTests
//
//  Created by Eric Roca on 30/05/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import XCTest
@testable import Hotel_Reservation

class Hotel_ReservationTests: XCTestCase {

    //MARK: Room Class Tests
    
    // Confirm that the Room initializer returns a Room object when passed valid parameters
    func testRoomInitializationSucceeds() {
        let room = Room.init(number: 1, type: "Single", price: 3.4)
        XCTAssertNotNil(room)
    }
    
    // Confirm that the Room initializer returns nil when passed invalid parameters
    func testRoomInitializationFails() {
        
        // Non-positive number
        let nonPositiveNumberRoom = Room.init(number: 0, type: "Single", price: 3.4)
        XCTAssertNil(nonPositiveNumberRoom)
        
        // Empty type
        let emptyTypeRoom = Room.init(number: 1, type: "", price: 3.4)
        XCTAssertNil(emptyTypeRoom)
        
        // Non-positive price
        let nonPositivePriceRoom = Room.init(number: 1, type: "Single", price: 0)
        XCTAssertNil(nonPositivePriceRoom)
    }
}
