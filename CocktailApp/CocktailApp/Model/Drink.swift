//
//  Drink.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
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
//    var strDrinkThumb: String
    var id: String
    var name: String
    var category: String
    var instructions: String
    var image: String
    
    var ingredient1: String
    var ingredient2: String
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    
    var measure1: String
    var measure2: String
    var measure3: String?
    var measure4: String?
    var measure5: String?
    var measure6: String?

    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case instructions = "strInstructions"
        case image = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
    }
}
