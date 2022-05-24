//
//  Drink.swift
//  CocktailApp
//
//  Created by MacBook Pro on 23/05/22.
//

import Foundation
import SwiftUI

struct Drink: Hashable, Codable{
    var id : Int
    var name : String
    var instruction : String
    
    private var imageLink: String
    var image: Image {
        Image(imageLink)
    }
}
