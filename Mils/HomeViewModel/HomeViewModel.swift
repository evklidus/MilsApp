//
//  HomeViewModel.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var choicedCategory = Category(id: "99990", recipes: [Recipe](), image: "Загрузка", name: "Загрузка")
    
    @Published var choicedRecipe = Recipe(id: "99989", name: "Загрузка", image: "", images: [], rating: "", time: "", complexity: "", cost: "", kcal: "", proteins: "", fats: "", carbohydrates: "", ingredients: [Ingredient(id: "1lh", ingradientName: "", weightPerPortion: "", nameForWeight: "", secondId: "")], tegs: [], steps: [])
    
    @Published var isPresent = false
    
    @Published var isPresentAddingIngredient = false
    
    @Published var filtersPresent = false
    
    @Published var caloriesStart = 0
    
    @Published var caloriesEnd = 600
    
    @Published var easyComplexity = true
    
    @Published var mediumComplexity = true
    
    @Published var hardComplexity = true
    
    @Published var complexitysArr : [String] = ["легко", "средне", "сложно"]
    
    @Published(key: "10") var bookmarskArray: [Recipe] = []
    
    @Published(key: "11") var purchasesArray: [Ingredient] = []
    @Published(key: "11$") var newPurchasesArray: [Ingredient] = []
    
    @Published(key: "anotherTheme$") var darkTheme = false
    
    @Published var tapOnStep = "notTapped"
    
    @Published var allRecipes : [Recipe] = []
    
    @Published var showAllRecipes : Bool = false
    
    @Published var confirmationCleanIngredients : Bool = false
}
