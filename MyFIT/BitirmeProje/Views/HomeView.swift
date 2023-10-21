//
//  HomeView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 06/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    let food : Food
    @EnvironmentObject var order : NutritionData
    @EnvironmentObject var ex : ExerciceData
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack{
                    WelcomeView()
                    CircleView(food: Food.example)
                    HomeExercicesView()
                    Spacer()
                }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(food : Food.example)
            .environmentObject(NutritionData())
            .environmentObject(ExerciceData())
        }
}
