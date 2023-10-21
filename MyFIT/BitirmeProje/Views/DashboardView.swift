//
//  DashboardView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 10/05/2023.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var order : NutritionData
    @EnvironmentObject var ex : ExerciceData
    
    var body: some View {
        NavigationStack{
                List{
                    Section("Menu"){
                        ForEach(order.foods){ item in
                            HStack{
                                Text(item.name)
                                    .foregroundColor(.pink)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                List{
                    Section("Exercices"){
                        ForEach(ex.exercices){ item in
                            HStack{
                                Text(item.name)
                                    .foregroundColor(.pink)
                            }
                        }
                        .onDelete(perform: deleteActivity)
                    }
                }
                .background(Color.gray)
                .navigationTitle("Dashboard")
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        order.foods.remove(atOffsets: offsets)
    }

    
    func deleteActivity(at offsets: IndexSet){
        ex.exercices.remove(atOffsets: offsets)
    }

}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(NutritionData())
            .environmentObject(ExerciceData())
    }
}
