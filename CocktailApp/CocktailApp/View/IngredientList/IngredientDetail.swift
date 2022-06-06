//
//  IngredientDetail.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct IngredientDetail: View {
    var ingredient: Ingredient
    var body: some View {
        ScrollView {
            SwiftUI.Text(ingredient.ingredientName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding([.leading, .bottom, .trailing], 20.0)
            
            SwiftUI.Text(ingredient.description)
                .font(.body)
                .padding()
        }
    }
}

struct IngredientDetail_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetail(ingredient: ingredients[0])
    }
}
