//
//  ProfilView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 12/05/2023.
//

import SwiftUI

struct ProfilView: View {
    
    enum Gender: String, CaseIterable, Identifiable {
        case male
        case female
        case other
        var id: String { self.rawValue }
    }
    
    @State var name = ""
    @State var surname = ""
    @State var email = ""
    @State var gender: Gender = .male
    @State private var birthdate = Date()
    @State var weight = 0
    
    @EnvironmentObject var dataManager : DataManager
    
    var body: some View {

                Form {
        
                    Section(header: Text("General")) {
                        TextField("Name", text: $name)
                        TextField("Surname", text: $surname)
                        TextField("Email", text: $email)

                    }
                    Section(header: Text("User Info")) {
                        // Segment Picker
                        Picker("Gender", selection: $gender) {
                            ForEach(Gender.allCases) { gender in
                                Text(gender.rawValue.capitalized).tag(gender)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        // Date picker
                        DatePicker("Date of birth",
                                   selection: $birthdate,
                                   displayedComponents: [.date])
                        // Scroll picker
                        Picker("Weight", selection: $weight) {
                            ForEach(0...150, id : \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    Section {
                        Button{
                            dataManager.addProfil(name : name , surname : surname, email : email, gender : gender.rawValue, birthdate : birthdate, weight : weight )
                        }label: {
                            Text("Save information")
                        }
                    }
                    
                }.navigationTitle("Profil 👤")
  
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
            .environmentObject(DataManager())
            
    }
}
