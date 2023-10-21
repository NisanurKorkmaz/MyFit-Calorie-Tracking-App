//
//  CircleView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 02/05/2023.
//

import SwiftUI

struct CircleView: View {
    @EnvironmentObject var order : NutritionData
    @EnvironmentObject var ex : ExerciceData
    let food : Food
    
    var body: some View {
        
        let total_calories = order.total
        let progress : Double = Double((total_calories*100/1850))
        let p = progress/100
        
        let total_fat = order.stat_fat
        let pfat : Double = (total_fat/100)
        
        let total_protein = order.stat_protein
        let pprotein : Double = total_protein/70
        
        let total_carbs = order.stat_carbs
        let pcarbs : Double = total_carbs/250
        
        VStack{
            VStack{
                Text("Calories")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("available = goal - food + exercices ")
                    .font(.system(size : 13))
            }
            .padding()
            HStack(spacing : 12){
                ZStack{
                    Circle()
                        .stroke(Color.gray.opacity(0.6), lineWidth: 12)
                    Circle()
                        .trim(from: 0, to: CGFloat(p))
                        .stroke(Color.pink.opacity(0.8), lineWidth: 12)
                }
                .rotationEffect(Angle (degrees: -90))
                .frame(width: 150)
                .overlay (
                    Text(String(1850 - order.total + ex.total_calories))
                        .font (.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(Color.gray.opacity(0.6))
                )
                VStack(alignment: .leading, spacing: 5){
                    Text("Goal : 1850 kcal")
                        .font(.system(size: 15))
                    Text("Food : \(total_calories) kcal")
                        .font(.system(size: 15))
                    Text("Exercices : \(ex.total_calories) kcal")
                        .font(.system(size: 15))
                }
            }
            Spacer()
            Spacer()
            VStack{
                Text("Your stats")
                    .font(.title2)
            }
                
                HStack(spacing : 35){
                    VStack{
                        Text("Fat")
                        ZStack{
                            Circle()
                                .stroke(Color.gray.opacity(0.6), lineWidth: 10)
                            Circle()
                                .trim(from: 0, to: CGFloat(pfat))
                                .stroke(Color.orange.opacity(0.8), lineWidth: 10)
                            }
                            .rotationEffect(Angle (degrees: -90))
                            .overlay(
                                    Text("\(order.stat_fat, specifier: "%.1f")")
                                    .font (.system(size: 10, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.gray.opacity(0.6))
                            )
                    }
                    VStack{
                        Text("Protein")
                        ZStack{
                            Circle()
                                .stroke(Color.gray.opacity(0.6), lineWidth: 10)
                            Circle()
                                .trim(from: 0, to: CGFloat(pprotein))
                                .stroke(Color.blue.opacity(0.8), lineWidth: 10)
                            }
                            .rotationEffect(Angle (degrees: -90))
                            .overlay(
                                    Text("\(order.stat_protein, specifier: "%.1f")")
                                    .font (.system(size: 10, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.gray.opacity(0.6))
                            )
                    }
                    VStack{
                        Text("Carbs")
                        ZStack{
                            Circle()
                                .stroke(Color.gray.opacity(0.6), lineWidth: 10)
                            Circle()
                                .trim(from: 0, to: CGFloat(pcarbs))
                                .stroke(Color.green.opacity(0.8), lineWidth: 10)
                            }
                            .rotationEffect(Angle (degrees: -90))
                            .overlay(
                                    Text("\(order.stat_carbs, specifier: "%.1f")")
                                    .font (.system(size: 10, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.gray.opacity(0.6))
                            )
                    }
                }

        }
        .padding()
        .frame(width: 350, height: 350)
        .background(Color.red.opacity(0.5))
        .clipShape (RoundedRectangle (cornerRadius: 20, style: .continuous))
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(food: Food.example)
            .environmentObject(NutritionData())
            .environmentObject(ExerciceData())
    }
}
