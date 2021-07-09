//
//  Ingredient.swift
//  Mils
//
//  Created by Erik Minasov on 06.07.2021.
//

import Foundation

struct Ingredient:  Hashable, Codable, Equatable {
    var id : String
    var ingradientName : String
    var weightPerPortion : String
    var nameForWeight : String
    var secondId : String
}
