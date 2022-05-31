//
//  ViewModel.swift
//  CocktailApp
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation
import SwiftUI

class ViewModelDrink: ObservableObject {
    @Published var drink: [Drink] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let drinks = try JSONDecoder().decode(DrinkArray.self, from: data)
                DispatchQueue.main.async {
                    self?.drink = drinks.drinks
                }
            }
            
            catch {
                
            }
        }
        
        task.resume()
    }
}

class ViewModelRandomDrink: ObservableObject {
    @Published var drink: [Drink] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let drinks = try JSONDecoder().decode(DrinkArray.self, from: data)
                DispatchQueue.main.async {
                    self?.drink = drinks.drinks
                }
            }
            
            catch {
                
            }
        }
        
        task.resume()
    }
}

