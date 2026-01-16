//
//  Registration.swift
//  HotelRegustration
//
//  Created by GEU on 12/01/26.
//

import Foundation
struct Registration {
    var firstName: String
    var lastName: String
    var email: String
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    var wifi: Bool
    var roomType: RoomType
    
}

struct RoomType: Equatable{
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    
    static let all: [RoomType] = [
        RoomType(id: 1, name: "Two Queen", shortName: "2Q", price: 179),
        RoomType(id: 2, name: "King", shortName: "K", price: 299),
        RoomType(id: 3, name: "Penthouse", shortName: "PHS", price: 399),
    ]
    static func == (lhs: RoomType, rhs: RoomType) -> Bool {
        lhs.id == rhs.id
    }
        
}
