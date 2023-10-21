//
//  TabBar.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 06/04/2023.
//

import SwiftUI

struct TabBar: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.red.opacity(0.8))
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white.opacity(0.5))
        }
    
    @EnvironmentObject var order : NutritionData
    @EnvironmentObject var ex : ExerciceData
    @EnvironmentObject var dataManager : DataManager
    var body: some View {
        TabView{
            HomeView(food: Food.example)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            DashboardView()
                .tabItem{
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                }
            SearchPageView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
            ExercicesView()
                .tabItem{
                    Label("Exercices", systemImage: "figure.walk")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
                
        }
        .accentColor(.pink)
        .environmentObject(NutritionData())
        .environmentObject(ExerciceData())
        .environmentObject(DataManager())

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(NutritionData())
            .environmentObject(ExerciceData())
            .environmentObject(DataManager())
    }
}
