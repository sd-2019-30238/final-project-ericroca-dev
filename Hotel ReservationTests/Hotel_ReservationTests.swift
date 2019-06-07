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

    // MARK: - Room Class Tests
    
    // Confirm that the Room initializer returns a Room object when passed valid parameters
    func testRoomInitializationSucceeds() {
        let room = Room.init(number: 1, type: "Single", price: 3.4, isAvailable: true)
        XCTAssertNotNil(room)
    }
    
    // Confirm that the Room initializer returns nil when passed invalid parameters
    func testRoomInitializationFails() {
        
        // Non-positive number
        let nonPositiveNumberRoom = Room.init(number: 0, type: "Single", price: 3.4, isAvailable: true)
        XCTAssertNil(nonPositiveNumberRoom)
        
        // Empty type
        let emptyTypeRoom = Room.init(number: 1, type: "", price: 3.4, isAvailable: true)
        XCTAssertNil(emptyTypeRoom)
        
        // Non-positive price
        let nonPositivePriceRoom = Room.init(number: 1, type: "Single", price: 0, isAvailable: true)
        XCTAssertNil(nonPositivePriceRoom)
    }
    
    // MARK: - Booking Class Tests
    
    // Confirm that the Booking initializer returns a Booking object when passed valid parameters
    func testBookingInitializationSucceeds() {
        let booking = Booking.init(user: "user", room: 100, hasJacuzzi: true, hasSwimming: true, hasMeal: true, roomPrice: 100, totalPrice: 100)
        XCTAssertNotNil(booking)
    }
    
    // Confirm that the Booking initializer returns nil when passed invalid parameters
    func testBookingInitializationFails() {
        
        // Empty user
        let emptyUserRoom = Booking.init(user: "", room: 100, hasJacuzzi: true, hasSwimming: true, hasMeal: true, roomPrice: 100, totalPrice: 100)
        XCTAssertNil(emptyUserRoom)
        
        // Non-positive room number
        let nonPositiveRoomNumberBooking = Booking.init(user: "user", room: -1, hasJacuzzi: true, hasSwimming: true, hasMeal: true, roomPrice: 100, totalPrice: 100)
        XCTAssertNil(nonPositiveRoomNumberBooking)
        
        // Non-positive room price
        let nonPositiveRoomPriceBooking = Booking.init(user: "user", room: 100, hasJacuzzi: true, hasSwimming: true, hasMeal: true, roomPrice: -100, totalPrice: 100)
        XCTAssertNil(nonPositiveRoomPriceBooking)
        
        // Non-positive total price
        let nonPositiveTotalPriceBooking = Booking.init(user: "user", room: 100, hasJacuzzi: true, hasSwimming: true, hasMeal: true, roomPrice: 100, totalPrice: -100)
        XCTAssertNil(nonPositiveTotalPriceBooking)
    }
}
