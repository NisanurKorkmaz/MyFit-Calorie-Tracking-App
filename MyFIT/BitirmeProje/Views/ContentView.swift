//
//  ContentView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 04/04/2023.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_status") var status = false
    @StateObject var model = ModelData()
    @EnvironmentObject var order : NutritionData
    @EnvironmentObject var ex : ExerciceData
    @EnvironmentObject var dataManager : DataManager
    var body: some View {
        ZStack{
            if status{
                TabBar()
            }else{
                LoginView(model: model)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NutritionData())
            .environmentObject(ExerciceData())
            .environmentObject(DataManager())
    }
}
