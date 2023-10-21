//
//  ExercicesData.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 11/05/2023.
//
// Exercice to store exercices data


import Foundation
import Firebase

struct Exercices : Codable, Hashable, Identifiable {
    
    let id = UUID()
    var name : String
    var calories : Int
    var duration : Int
    
}

extension Exercices {
    static let examples : [Exercices] = [
        .init(name : "Walking", calories: 130, duration: 30),
        .init(name : "Hiking", calories: 245, duration: 30),
        .init(name : "Jogging", calories: 385, duration: 30),
        .init(name : "Basketball", calories: 280, duration: 30),
        .init(name : "Football", calories: 315, duration: 30),
        .init(name : "Box", calories: 210, duration: 30),
        .init(name : "Yoga", calories: 175, duration: 30),
        .init(name : "Dance", calories: 155, duration: 30),
        .init(name : "Swimming", calories: 350, duration: 30),
        .init(name : "Bicycle", calories: 330, duration: 30)        
    ]
}

class ExerciceData : ObservableObject {
    @Published var exercices = [Exercices]()
    
    var total_calories: Int {
        if exercices.count > 0 {
            return Int(exercices.reduce(0) { $0 + $1.calories })
        } else {
            return 0
        }
    }
    
    var total_duration: Int {
        if exercices.count > 0 {
            return Int(exercices.reduce(0) { $0 + $1.duration })
        } else {
            return 0
        }
    }
    
    func add(item: Exercices) {
        exercices.append(item)
    }

    func remove(item: Exercices) {
        if let index = exercices.firstIndex(of: item) {
            exercices.remove(at: index)
        }
    }
}
