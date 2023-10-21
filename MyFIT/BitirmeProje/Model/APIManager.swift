//
//  APIManager.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 18/04/2023.
//
// API FOR FOOD SEARCH
// NutritionData class to store data of food


import Foundation


struct Food: Codable, Identifiable, Hashable {
    let id = UUID()
    var name: String
    var calories: Double
    var serving_size_g: Double
    var fat_total_g: Double
    var fat_saturated_g: Double
    var protein_g: Double
    var sodium_mg: Double
    var potassium_mg: Double
    var cholesterol_mg: Double
    var carbohydrates_total_g: Double
    var fiber_g: Double
    var sugar_g: Double
    
    
    static let example = Food(name: "croissant", calories: 395, serving_size_g: 100, fat_total_g: 21.1, fat_saturated_g: 11.7, protein_g: 8.2, sodium_mg: 463, potassium_mg: 105, cholesterol_mg: 66, carbohydrates_total_g: 45, fiber_g: 2.6, sugar_g: 11.2)
}

class Api : ObservableObject{
    @Published var foods = [Food]()
    
    func loadData(query: String, completion:@escaping ([Food]) -> ()) {
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/nutrition?query="+query!)!
        var request = URLRequest(url: url)
        request.setValue("XMP++Yrtu5+4AR1TTTxCZQ==2GNU8gPBlm6xlkok", forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let foods = try! JSONDecoder().decode([Food].self, from: data!)
            print(foods)
            DispatchQueue.main.async {
                completion(foods)
            }
        }.resume()
    }
}

class NutritionData : ObservableObject {
    @Published var foods = [Food]()

    var total: Int {
        if foods.count > 0 {
            return Int(foods.reduce(0) { $0 + $1.calories })
        } else {
            return 0
        }
    }
    var stat_fat : Double {
        if foods.count > 0{
            return Double(foods.reduce(0) { $0 + $1.fat_total_g } )
        }else{
            return 0
        }
    }
    var stat_protein : Double {
        if foods.count > 0{
            return Double(foods.reduce(0) { $0 + $1.protein_g } )
        }else{
            return 0
        }
    }
    var stat_carbs : Double {
        if foods.count > 0{
            return Double(foods.reduce(0) { $0 + $1.carbohydrates_total_g } )
        }else{
            return 0
        }
    }
    func add(item: Food) {
        foods.append(item)
    }

    func remove(item: Food) {
        if let index = foods.firstIndex(of: item) {
            foods.remove(at: index)
        }
    }
}
