//
//  SettingsView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 06/04/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var model = ModelData()
    @EnvironmentObject var dataManager : DataManager

    var settings : [Settings] = [.init(name: "profil", imageName: "person.crop.circle"),
                                 .init(name: "logout", imageName: "rectangle.portrait.and.arrow.right")]
    
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: ProfilView()){
                    Button(action: model.logOut, label: {
                        HStack{
                            Image(systemName: "person.crop.circle")
                            Text(" Profil")
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                    })
                }
                Button(action : model.logOut, label: {
                    HStack{
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("LogOut")
                    }
                    
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                })
            }
            .navigationTitle("Settings")
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(DataManager())
    }
}

        struct Settings : Hashable {
            let name : String
            let imageName : String
            
        }
