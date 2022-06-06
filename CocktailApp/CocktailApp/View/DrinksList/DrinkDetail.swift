//
//  DrinkDetail.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct DrinkDetail: View {
    var drink: Drink
    
    var body: some View {
        ScrollView{
            SwiftUI.Text(drink.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding([.leading, .bottom, .trailing], 20.0)
            
            URLImageDrinkDetail(urlString: drink.image)
            
            SwiftUI.Text("Ingredients")
                .font(.title2)
                .fontWeight(.bold)
                .padding(20.0)
            
            SwiftUI.Text(drink.measure1 + drink.ingredient1)
            SwiftUI.Text(drink.measure2 + drink.ingredient2)
            if drink.ingredient3 != nil{
                SwiftUI.Text((drink.measure3 ?? "") + (drink.ingredient3 ?? ""))
            }
            if drink.ingredient4 != nil {
                SwiftUI.Text((drink.measure4 ?? "") + (drink.ingredient4 ?? ""))
            }

            SwiftUI.Text("Instructions")
                .font(.title2)
                .fontWeight(.bold)
                .padding([.top, .leading, .trailing], 20.0)
            
            SwiftUI.Text(drink.instructions)
                .font(.body)
                .padding()
        }
    }
}

struct URLImageDrinkDetail: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(15)
        }
        else {
            Image("")
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(15)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: urlString) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, _  in
            self.data = data
        }
        task.resume()
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinks[0])
    }
}
