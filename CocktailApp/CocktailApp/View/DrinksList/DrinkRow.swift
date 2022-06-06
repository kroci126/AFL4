//
//  DrinkRow.swift
//  CocktailApp
//
//  Created by MacBook Pro on 24/05/22.
//

import SwiftUI

struct DrinkRow: View {
    var drink: Drink

    var body: some View {
        HStack{
            URLImageDrinkRow(urlString: drink.image)
            
            Text(drink.name)
                .font(.title)

            Spacer()
        }
    }
}

struct URLImageDrinkRow: View {
    let urlString: String
    @State var data: Data?

    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .padding([.top, .bottom, .trailing])
        }
        else {
            Image("")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .padding([.top, .bottom, .trailing])
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

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DrinkRow(drink: drinks[0])
            DrinkRow(drink: drinks[1])
        }
        .previewLayout(.fixed(width:300, height: 150))
    }
}
