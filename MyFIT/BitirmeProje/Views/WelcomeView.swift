//
//  WelcomeView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 03/05/2023.
//

import SwiftUI

struct WelcomeView: View {
    let date = Date()
    @EnvironmentObject var order : NutritionData
    
    var body: some View {
        VStack{
            VStack{
                Text("WELCOME TO MYFIT ")
            }
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text("Hi !")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                HStack{
                    Text("Today is :")
                    Text(date.formatted(.dateTime.weekday(.wide)))
                    Text(", so")
                }
                HStack{
                    Text("Let's go for a new day !")
                }
            }
            .font(.title2)
            .padding()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(NutritionData())
    }
}
