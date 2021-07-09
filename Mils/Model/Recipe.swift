//
//  Recipe.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import Foundation

struct Recipe: Identifiable, Equatable, Codable {
    var id : String
    var name : String
    var image : String
    var images : [String]
    var rating : String
    var time : String
    var complexity : String
    var cost : String
    var kcal : String
    var proteins : String
    var fats : String
    var carbohydrates : String
    var ingredients : [Ingredient]
    var tegs : [String]
    var steps : [String]
}
