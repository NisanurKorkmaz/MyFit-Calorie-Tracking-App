//
//  NutritionData.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 02/05/2023.
//
// DataManager for add profil data on Firestore


import Foundation
import Firebase

struct Profil : Identifiable {
    var id : String
    var name : String
    var surname : String
    var gender : String
    var birthdate : Date
    var weight : Int
}



class DataManager : ObservableObject {
    
//    @StateObject var model = ModelData()
    @Published var profil : [Profil] = []
    
    func addProfil(name : String, surname : String, email : String, gender : String, birthdate : Date, weight : Int){
        let db = Firestore.firestore()
        let ref = db.collection("Profil").document(email)
        
        ref.setData(["name": name, "surname": surname, "gender": gender, "birthdate": birthdate, "weight": weight ]) { error in
            if let error = error {
                print (error.localizedDescription)
            }
        }
    }
    
}
