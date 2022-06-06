//
//  IngredientRow.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct IngredientRow: View {
    var ingredient: Ingredient
    
    var body: some View {
        HStack{
            Text(ingredient.ingredientName)
                .font(.title3)
            
            Spacer()
        }
    }
}

struct IngredientRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IngredientRow(ingredient: ingredients[0])
            IngredientRow(ingredient: ingredients[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
