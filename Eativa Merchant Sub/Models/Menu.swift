//
//  Menu.swift
//  Eativa Merchant Sub
//
//  Created by Frederic Orlando on 28/11/19.
//  Copyright © 2019 Frederic Orlando. All rights reserved.
//

import Foundation

class Menu : Codable {
    var id : String? // D
    var merchantId : String? // E
    var name : String? // D, E
    var price : Int? // D, E
    var isAvailable : Bool? // D
    var image : String? // D, E
    
    private enum CodingKeys: String, CodingKey {
        case id
        case merchantId
        case name
        case price
        case isAvailable
        case image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.price = try container.decodeIfPresent(Int.self, forKey: .price)
        self.isAvailable = try container.decodeIfPresent(Bool.self, forKey: .isAvailable)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
    }
    
    init(name : String, price : Int, isAvailable : Bool) {
        self.name = name
        self.price = price
        self.isAvailable = isAvailable
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(merchantId, forKey: .merchantId)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
        try container.encode(image, forKey: .image)
    }
}
