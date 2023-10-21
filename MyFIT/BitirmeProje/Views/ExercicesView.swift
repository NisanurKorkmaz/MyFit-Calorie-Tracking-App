//
//  ExercicesView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 11/05/2023.
//

import SwiftUI

struct ExercicesView: View {
    @EnvironmentObject var ex : ExerciceData
    
    var body: some View {
        NavigationStack{
            List{
                Section("Add an activity on your dashboard"){
                    ForEach(Exercices.examples){ exercice in
                        NavigationLink(value : exercice){
                            VStack{
                                Text(exercice.name)
                                    .foregroundColor(.pink)
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Exercices 🏃‍♀️")
            .foregroundColor(.pink)
            .navigationDestination(for: Exercices.self){ exercice in
                
                VStack{
                    Text("Activity : \(exercice.name)")
                        .font(.title)
                        .padding()
                    VStack(alignment: .leading, spacing: 25){
                        Text("🔥 Calories burned : \(exercice.calories) kcal ")
                            .font(.title2)
                        
                        Text("⏱️ Duration : \(exercice.duration) minutes ")
                            .font(.title2)
                    }
//                    .padding()
                }
                .frame(width: 350, height: 200)
                .background(Color.red.opacity(0.5))
                .clipShape (RoundedRectangle (cornerRadius: 20, style: .continuous))
                .foregroundColor(.pink)
                .padding()

                HStack(){
                    Spacer()
                    Button("ADD THIS ACTIVITY"){
                        ex.add(item: exercice)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.pink, lineWidth: 2)
                    )
            
                    .font(.title2)
                    .foregroundColor(Color.pink)
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ExercicesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercicesView()
            .environmentObject(ExerciceData())
    }
}
