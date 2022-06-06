//
//  HomeRow.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct HomeRow: View {
    var drink: Drink
    
    var body: some View {
        HStack {
            URLImageHomeRow(urlString: drink.image)
        }
    }
}

struct URLImageHomeRow: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.leading)
        }
        else {
            Image("")
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.leading)
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

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeRow(drink: drinks[0])
            HomeRow(drink: drinks[1])
        }
    }
}
