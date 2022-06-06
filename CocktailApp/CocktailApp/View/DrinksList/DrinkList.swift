//
//  DrinkList.swift
//  CocktailApp
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct DrinkList: View {
    @StateObject var viewModel = ViewModelDrink()
    @State var searchText = ""

    var body: some View {
        NavigationView {
            List() {
                ForEach(viewModel.filteredDrink, id:\.self){ Drink in
                    NavigationLink(destination: DrinkDetail(drink: Drink)) {
                        DrinkRow(drink: Drink)
                    }
                }
            }
            .navigationTitle("Drink List")
            .onAppear(){
                viewModel.fetch()
            }
            .searchable(text: $searchText)
            .onChange(of: searchText){
                data in viewModel.search(with: data)
            }
        }
    }
}

struct DrinkList_Previews: PreviewProvider {
    static var previews: some View {
        DrinkList()
    }
}
