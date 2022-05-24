//
//  Drink.swift
//  CocktailApp
//
//  Created by MacBook Pro on 23/05/22.
//

import Foundation
import SwiftUI

struct DrinkResponse: Decodable {
    let results: [Drink]
}

struct Drink: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var instruction: String
    var imageurl: String
    var ingredient1: String
    var ingredient2: String
    var ingredient3: String
    var ingredient4: String
    var ingredient5: String
    var ingredient6: String
    var ingredient7: String
    var ingredient8: String
    var measure1: String
    var measure2: String
    var measure3: String
    var measure4: String
    var measure5: String
    var measure6: String
    var measure7: String
    var measure8: String
    
    
}
