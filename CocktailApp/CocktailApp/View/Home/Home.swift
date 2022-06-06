//
//  Home.swift
//  CocktailApp
//
//  Created by MacBook Pro on 06/06/22.
//

import SwiftUI

struct Home: View {
    @State private var currentIndex = 0
    
    @StateObject var viewModel = ViewModelDrink()
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var nameArray = ["Mojito", "Margarita", "Dry Martini"]
    
    var body: some View {
        ScrollView {
            VStack{
                
                HStack{
                    Text("Recommended Drinks")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(8.0)
                    Spacer()
                }
                
                GeometryReader { proxy in
                    TabView(selection: $currentIndex) {
                        ForEach(1..<4) { num in
                            Image("image\(num)")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(5)
                                .overlay(Color.black.opacity(0.15))
                                .tag(num)
                                .overlay {
                                    TextOverlay(NamaCocktail: nameArray[num-1])
                        }
                        }
                    }.tabViewStyle(PageTabViewStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                        .frame(width: .infinity, height: 250)
                        .onReceive(timer, perform: { _ in
                            withAnimation{
                                currentIndex = currentIndex < 3 ? currentIndex + 1 : 0
                            }
                        })
                }.frame(height: 250)
//                    .overlay {
//                        TextOverlay(NamaCocktail: "Mojito")
//                    }
                        
                        HStack{
                            Text("Drinks")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(8.0)
                            Spacer()
                        }
                        
                        HStack{
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .top, spacing: 0) {
                                    ForEach(viewModel.drink, id:\.self){ Drink in
                                        HomeRow(drink: Drink)
                                    }
                                }
                            }.onAppear(){
                                viewModel.fetch()
                            }
                            .frame(height: 150)
                        }
                        
                        HStack{
                            Text("Ingredients")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(8.0)
                            Spacer()
                        }
                        
                        HStack{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(alignment: .top, spacing: 0){
                                    Image("Tequila")
                                        .resizable()
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(5)
                                    Image("Rum")
                                        .resizable()
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(5)
                                    Image("Gin")
                                        .resizable()
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(5)
                                    Image("Vodka")
                                        .resizable()
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(5)
                                }
                            }
                        }.padding(.bottom, 40)
                        
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
        }
    }
    
    struct TextOverlay: View {
        var NamaCocktail:String
        
        var gradient: LinearGradient {
            .linearGradient(
                Gradient(colors: [.black.opacity(0), .black.opacity(0)]),
                startPoint: .bottom,
                endPoint: .center)
        }
        
        var body: some View {
            ZStack(alignment: .bottomLeading) {
                gradient
                VStack(alignment: .leading) {
                    Text(NamaCocktail)
                        .font(.title2)
                        .bold()
                        .offset(y: -28)
                }
                .padding()
            }
            .foregroundColor(.white)
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
