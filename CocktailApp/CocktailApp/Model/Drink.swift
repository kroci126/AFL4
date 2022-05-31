//
//  Drink.swift
//  CocktailApp
//
//  Created by MacBook Pro on 23/05/22.
//

import Foundation
import SwiftUI

struct DrinkArray: Hashable, Codable {
    let drinks: [Drink]
}

struct Drink: Hashable, Codable{
//    var idDrink : String
//    var strDrink : String
//    var strInstructions : String
//    var strCategory : String
//    var strIngredient : String
//
//    private var strDrinkThumb: String
//    var image: Image {
//        Image(strDrinkThumb)
//    }
    var id: String
    var name: String
    var category: String?
    var instructions: String?
    var ingredient1: String?
    var image: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case instructions = "strInstructions"
        case image = "strDrinkThumb"
    }
    
}
