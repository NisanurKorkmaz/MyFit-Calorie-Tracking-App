//
//  ExerciceView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 10/05/2023.
//

import SwiftUI

struct HomeExercicesView: View {
    @EnvironmentObject var ex : ExerciceData
    
    var body: some View {
        var total_exercices : Int = ex.total_calories
        var total_min : Int = ex.total_duration
        VStack{
            Text("Exercices")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            VStack(alignment : .leading, spacing: 20){
                HStack{
                    Image(systemName: "flame.fill")
                    Text("Calories burned : ")
                    Text(String(total_exercices))
                    Text("kcal")
                }
                HStack{
                    Image(systemName: "timer")
                    Text("Duration of activity : ")
                    Text(String(total_min))
                    Text("min")
                }
            }
        }
        .padding()
        .frame(width: 350, height: 170)
        .background(Color.red.opacity(0.5))
        .clipShape (RoundedRectangle (cornerRadius: 20, style: .continuous))
        .padding()
        
    }
}

struct ExerciceView_Previews: PreviewProvider {
    static var previews: some View {
        HomeExercicesView()
            .environmentObject(ExerciceData())
    }
}
