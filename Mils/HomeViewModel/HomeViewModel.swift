//
//  HomeViewModel.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var choicedCategory: Category = Category(id: "99990", recipes: [Recipe](), image: "Загрузка", name: "Загрузка")
    
    @Published var choicedRecipe: Recipe = Recipe(id: "999989", name: "Загрузка", image: "", images: [], rating: "", time: "", complexity: "", cost: "", kcal: "", proteins: "", fats: "", carbohydrates: "", ingredients: [Ingredient(id: "1lh", ingradientName: "", weightPerPortion: "", nameForWeight: "", secondId: "")], tegs: [], steps: [])
    
    @Published var isPresent = false
    
    @Published var isPresentAddingIngredient = false
    
    @Published var filtersPresent = false
    
    @Published var caloriesStart = 0
    
    @Published var caloriesEnd = 600
    
    @Published var complexitysArr : [String] = ["легко", "средне", "сложно"]
    
    @Published var timesArr : [String] = ["быстро", "средне", "долго"]
    
    @Published var costsArr : [String] = ["дешево", "средне", "дорого"]
    
    @Published(key: "10") var bookmarskArray: [Recipe] = []
    
    @Published(key: "11") var purchasesArray: [Ingredient] = []
    @Published(key: "11$") var newPurchasesArray: [Ingredient] = []
    
    @Published(key: "anotherTheme$") var darkTheme = false
    
    @Published var tapOnStep = "notTapped"
    
    @Published var allRecipes : [Recipe] = []
    
    @Published var showAllRecipes : Bool = false
    
    @Published var confirmationCleanIngredients : Bool = false
    
    @Published var startCook : Bool = false
    
    func choiceRecipe(recipe: Recipe) {
        choicedRecipe = recipe
        withAnimation {isPresent.toggle()}
        withAnimation {hideKeyboard()}
    }
    
    func saveRecipe(isTapped: inout Bool, recipe: Recipe) {
        isTapped.toggle()
        
        if isTapped == true {
            
            bookmarskArray.append(recipe)
            simpleSuccess(style: .rigid)
        } else {
            
            for deleteRecipe in bookmarskArray {
                
                if deleteRecipe.name == recipe.name {
                    
                    let index = bookmarskArray.firstIndex(of: deleteRecipe)
                    bookmarskArray.remove(at: index!)
                    simpleSuccess(style: .light)
                }
            }
        }
        
        UserDefaults.standard.setValue(isTapped, forKey: recipe.name)
        isTapped = UserDefaults.standard.bool(forKey: recipe.name)
    }
    
    func appendIngredient(ingredient: Ingredient, addArr: inout [String]) {
        
        var idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
        
        var secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
        
        if self.purchasesArray.count != 0 {
            
            var add = false
            
            for ingredientFromArr in self.purchasesArray {
                
                if ingredientFromArr.ingradientName == ingredient.ingradientName {
                    
                    var updatedIngredient = ingredientFromArr
                    
                    updatedIngredient.weightPerPortion = String(Int(ingredientFromArr.weightPerPortion)! + Int(ingredient.weightPerPortion)!)
                    
                    self.purchasesArray[self.purchasesArray.firstIndex(of: ingredientFromArr)!] = updatedIngredient
                    
                    add = true
                }
            }
            
            if add == false {
                
                self.purchasesArray.append(ingredient)
            }
        }
        else {
            self.purchasesArray.append(ingredient)
        }
        
        UserDefaults.standard.setValue(true, forKey: ingredient.id)
        
        idsArray.append(ingredient.id)
        
        UserDefaults.standard.setValue(idsArray, forKey: ingredient.ingradientName)
        
        secondIdsArray.append(ingredient.secondId)
        
        UserDefaults.standard.setValue(secondIdsArray, forKey: ingredient.ingradientName + "!")
        
        withAnimation {addArr.append(ingredient.ingradientName)}
        
        UserDefaults.standard.setValue(addArr, forKey: self.choicedRecipe.ingredients.first!.secondId)
    }
    
    func addAllIngredients(allAdded: inout Bool, addArr: inout [String]) {
        for ingredient in choicedRecipe.ingredients {
            if !(purchasesArray.contains(ingredient)) {
                appendIngredient(ingredient: ingredient, addArr: &addArr)
            }
        }
        allAdded = true
    }
    
    func reloadIngView(addArr: inout [String], allAdded: inout Bool) {
        addArr = UserDefaults.standard.stringArray(forKey: choicedRecipe.ingredients.first!.secondId) ?? []
        
        for ingredient in choicedRecipe.ingredients {
            if !(purchasesArray.contains(ingredient)) {
                allAdded = false
            }
        }
    }
    
    func recoveryWeightIngredient(ingredient: inout Ingredient) {
        
        for originalIngredient in choicedRecipe.ingredients {
            
            if ingredient.ingradientName == originalIngredient.ingradientName {
                
                ingredient = originalIngredient
            }
        }
    }
    
    func tap(ingredient: Ingredient, isAddedForPurchases: inout Bool, idsArray: inout [String], secondIdsArray: inout [String], addArr: inout [String], allAdded: inout Bool, nCenter: Bool) {
        withAnimation {isAddedForPurchases.toggle()}
        
        if isAddedForPurchases {
            
            if purchasesArray.count != 0 {
                
                var add = false
                
                for ingredientFromPurchases in purchasesArray {
                    
                    if ingredientFromPurchases.ingradientName == ingredient.ingradientName {
                        
                        var updatedIngredient = ingredientFromPurchases
                        
                        updatedIngredient.weightPerPortion = String(Int(ingredientFromPurchases.weightPerPortion)! + Int(ingredient.weightPerPortion)!)
                        
                        purchasesArray[purchasesArray.firstIndex(of: ingredientFromPurchases)!] = updatedIngredient
                        
                        add = true
                    }
                }
                
                if add == false {
                    
                    purchasesArray.append(ingredient)
                }
            }
            else {
                purchasesArray.append(ingredient)
            }
            
            UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
            
            idsArray.append(ingredient.id)
            
            UserDefaults.standard.setValue(idsArray, forKey: ingredient.ingradientName)
            
            secondIdsArray.append(ingredient.secondId)
            
            UserDefaults.standard.setValue(secondIdsArray, forKey: ingredient.ingradientName + "!")
            
            withAnimation {addArr.append(ingredient.ingradientName)}
        } else {
            
            if purchasesArray.count != 0 {
                
                var remove = false
                
                for ingredientFromPurchases in purchasesArray {
                    
                    if ingredientFromPurchases.ingradientName == ingredient.ingradientName {
                        
                        if ingredientFromPurchases.weightPerPortion == ingredient.weightPerPortion {
                            purchasesArray.remove(at: purchasesArray.firstIndex(of: ingredientFromPurchases)!)
                            remove = true
                        }
                        else {
                            
                            var updatedIngredient = ingredientFromPurchases
                            
                            if Int(ingredientFromPurchases.weightPerPortion)! > Int(ingredient.weightPerPortion)! {
                                updatedIngredient.weightPerPortion = String(Int(ingredientFromPurchases.weightPerPortion)! - Int(ingredient.weightPerPortion)!)
                            }
                            else {
                                updatedIngredient.weightPerPortion = String(Int(ingredient.weightPerPortion)! - Int(ingredientFromPurchases.weightPerPortion)!)
                            }
                            
                            purchasesArray[purchasesArray.firstIndex(of: ingredientFromPurchases)!] = updatedIngredient
                            
                            remove = true
                        }
                    }
                }
                
                if remove == false {
                    
                    purchasesArray.remove(at: purchasesArray.firstIndex(of: ingredient)!)
                }
            }
            else {
                purchasesArray.remove(at: purchasesArray.firstIndex(of: ingredient)!)
            }
            
            UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
            
            if nCenter {
                idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
                idsArray.remove(at: idsArray.firstIndex(of: ingredient.id)!)
                
                secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
                secondIdsArray.remove(at: secondIdsArray.firstIndex(of: ingredient.secondId)!)
                
                UserDefaults.standard.setValue(secondIdsArray, forKey: ingredient.ingradientName + "!")
            }
            else {
                
                for id in idsArray {
                    
                    UserDefaults.standard.setValue(false, forKey: id)
                }
                
                idsArray.removeAll()
            }
            
            UserDefaults.standard.setValue(idsArray, forKey: ingredient.ingradientName)
            
            withAnimation {addArr.remove(at: addArr.firstIndex(of: ingredient.ingradientName)!)}
            
            allAdded = false
        }
        
        UserDefaults.standard.setValue(addArr, forKey: choicedRecipe.ingredients.first!.secondId)
    }
    
    func setIsAdded(isAddedForPurchases: inout Bool, ingredient: Ingredient) {
        isAddedForPurchases = UserDefaults.standard.bool(forKey: ingredient.id)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func simpleSuccess(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        //        let generator = UINotificationFeedbackGenerator()
        //        generator.notificationOccurred(.success)
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
