//
//  CategoriesView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 06/04/2023.
//

import SwiftUI

struct CategoriesView: View {
    var Liste = ["applejuice", "orangejuice", "baguette", "croissant", "chocolatecake", "donuts", "pancake", "espresso", "latte", "farfalle", "penne", "fruitsalad", "kebab", "pizza", "tacos", "sandwich", "toast", "tomatosoup", "tea", "greentea" ]
    
    var body: some View {
        NavigationView{
                VStack{
                    LazyVGrid(columns: [GridItem(.adaptive (minimum: 160), spacing: 15)], spacing: 15){
                        ForEach(Liste, id: \.self){ l in
                            Image(l)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(alignment: .bottom){
                                    Text(l)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    //                                .shadow(color: .black, radius: 3, x : 0, y : 0)
                                        .frame(maxWidth: 136)
                                        .padding()
                                }
                        }
                        .frame (width: 160, height: 217, alignment: .top)
                        .clipShape (RoundedRectangle (cornerRadius: 20, style: .continuous))
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
        }
        .navigationTitle("categories")
    }
    
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
            CategoriesView()
    }
}
