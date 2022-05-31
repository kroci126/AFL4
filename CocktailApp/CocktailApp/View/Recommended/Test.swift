//
//  Test.swift
//  CocktailApp
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct Test: View {
    @StateObject var viewModel = ViewModelDrink()
    @StateObject var viewModelRandom = ViewModelRandomDrink()
    
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        NavigationView{
            List{
                for i in viewModel.drink.size{
                    Drink in HStack{
                        Text(Drink.name)
                        
                        
                    }
                    
                    .padding(3)
                }
                .navigationTitle("Drinks")
                .onAppear{
                    viewModelRandom.fetch()
                }
                
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
