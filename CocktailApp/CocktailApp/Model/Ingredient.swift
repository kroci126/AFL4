//
//  Ingredient.swift
//  CocktailApp
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation

struct Ingredient: Hashable, Codable {
    var ingredientName: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case ingredientName = "strIngredient1"
        case description = "strDescription"
    }
}
