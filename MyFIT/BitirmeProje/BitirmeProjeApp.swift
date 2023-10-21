//
//  BitirmeProjeApp.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 04/04/2023.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct BitirmeProjeApp: App {

    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

