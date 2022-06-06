//
//  IngredientList.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct IngredientList: View {
    @State var searchText = ""
    @State var modelData = MDIngredient()
    var body: some View {
        NavigationView {
            List(filteredIngredient, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetail(ingredient: ingredient)
                } label: {
                    IngredientRow(ingredient: ingredient)
                }
            }
            .navigationTitle("Ingredient List")
            .searchable(text: $searchText, prompt: "Find an ingredient")
            .onChange(of: searchText) { data in
                modelData.search(with: data)
            }
            .onAppear(){
                modelData.search()
            }
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
