//
//  RcmdCard.swift
//  CocktailApp
//
//  Created by MacBook Pro on 24/05/22.
//

import SwiftUI

struct RcmdCard: View {
    @StateObject var viewModel = ViewModelDrink()
    
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.drink, id:\.self){
                    Drink in HStack{
                        URLImage(urlString: Drink.image)
                            .overlay {
                                ZStack(alignment: .bottomLeading) {
                                    gradient
                                    VStack(alignment: .leading) {
                                        Text(Drink.name) //pic name
                                            .font(.title)
                                    }
                                    .padding()
                                }
                                .foregroundColor(.white)
                            }
                        
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Drinks")
            .onAppear{
                viewModel.fetch()
            }

        }
    }
}

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
        }
        else {
            Image("")
                .aspectRatio(3 / 2, contentMode: .fit)
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: urlString) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, _ in
            self.data = data
        }
        task.resume()
    }
    
}

struct RcmdCard_Previews: PreviewProvider {
    static var previews: some View {
        RcmdCard()
    }
}
