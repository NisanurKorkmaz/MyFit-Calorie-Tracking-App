//
//  ModelData.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 05/04/2023.
//

import Foundation
import Firebase
import SwiftUI

// MODELDATA for authentification with Firebase 

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var signUpemail = ""
    @Published var signUpPassword = ""
    @Published var reEnterPassword = ""

    @Published var isSignUp = false
    
    @Published var alert = false
    @Published var alertMSG = ""
    
    @AppStorage("log_status") var status = false
    
    
    func login(){
        
        if email == "" || password == "" {
            self.alertMSG=" Fill de content correctly"
            self.alert.toggle()
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password){(result, err) in
            if err != nil {
                self.alertMSG = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            withAnimation{
                self.status = true
            }
            
        }
    }


    func signup(){
        if signUpemail == "" || signUpPassword == "" || reEnterPassword == "" {
            self.alertMSG = "fill content !!!"
            self.alert.toggle()
            return
        }
        
        if signUpPassword != reEnterPassword {
            self.alertMSG = "password mismatch !!!"
            self.alert.toggle()
            return
        }
        
        Auth.auth().createUser(withEmail: signUpemail, password: signUpPassword){
            (result, err) in
            if err != nil {
                self.alertMSG = err!.localizedDescription
                self.alert.toggle()
                return
            }
        }
    }
    func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
            self.status = false
            
            // clear data =
            email=""
            password=""
            signUpemail=""
            signUpPassword=""
            reEnterPassword=""
            
        }
        
        }
    }

    



