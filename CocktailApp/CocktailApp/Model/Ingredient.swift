//
//  Ingredient.swift
//  CocktailApp
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation

struct IngredientArray: Hashable, Codable {
    let drinks: [Ingredient]
}

struct Ingredient: Hashable, Codable {
    let strIngredient1: String
}
