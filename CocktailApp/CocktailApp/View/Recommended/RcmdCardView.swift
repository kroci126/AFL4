//
//  RcmdCardView.swift
//  CocktailApp
//
//  Created by MacBook Pro on 23/05/22.
//

import SwiftUI

struct RecommendedCV: View {
    var body: some View {
        Image("TestPic") //pic url
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .overlay {
                TextOverlay()
            }
    }
}

struct TextOverlay: View {
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View{
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text("Test Drink") //pic name
                    .font(.title)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct RecommendedCV_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCV()
    }
}
