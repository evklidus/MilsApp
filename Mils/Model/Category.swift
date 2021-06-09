//
//  Category.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import Foundation

struct Category: Identifiable, Equatable {
    
    var id: String
    var recipes: [Recipe]
    var image: String
    var name: String
}
