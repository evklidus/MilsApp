//
//  NewIngredientCell.swift
//  Mils
//
//  Created by Erik Minasov on 27.01.2021.
//

import SwiftUI

struct NewIngredientCell: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var ingredient : Ingredient
    
    @State var nCenter: Bool
    
    @State var isAddedForPurchases = false
    
    @Binding var multiplier: Int
    
    @Binding var addArr : [String]
    
    var width = UIScreen.main.bounds.width
    
    @State var idsArray : [String] = []
    
    @State var secondIdsArray : [String] = []
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            ZStack {
                
                Circle()
                    .fill(Color.white)
                    .frame(width: horizontalSizeClass != .compact ? (homeVM.choicedRecipe.ingredients.count < 9 ? width / 54 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5)) : width / 18, height: horizontalSizeClass != .compact ? width / 54 : width / 18)
                    .opacity(isAddedForPurchases ? 1 : 0)
                
                Image(systemName: isAddedForPurchases ? "checkmark.circle.fill" : "plus.circle")
                    .font(.system(size: horizontalSizeClass != .compact ? (homeVM.choicedRecipe.ingredients.count < 9 ? width / 42 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5)) : width / 14))
                    .foregroundColor(.orange)
                
            }
            
            Text(ingredient.ingradientName)
                .font(.system(size: horizontalSizeClass != .compact ? (homeVM.choicedRecipe.ingredients.count < 9 ? width / 50 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5)) : width / 20))
                .foregroundColor(homeVM.darkTheme ? .white : .black)
            
            Spacer()
            
            Text(ingredient.weightPerPortion)
                .font(.system(size: horizontalSizeClass != .compact ? (homeVM.choicedRecipe.ingredients.count < 9 ? width / 66 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5)) : width / 22))
                .foregroundColor(homeVM.darkTheme ? .white : .secondary)
            Text(ingredient.nameForWeight)
                .font(.system(size: horizontalSizeClass != .compact ? (homeVM.choicedRecipe.ingredients.count < 9 ? width / 66 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5)) : width / 22))
                .foregroundColor(homeVM.darkTheme ? .white : .secondary)
        }
        .background(Color.white.opacity(0.000001))
        .onTapGesture {
            
            withAnimation {isAddedForPurchases.toggle()}
            
            if isAddedForPurchases {
                
                if homeVM.purchasesArray.count != 0 {
                    
                    var add = false
                    
                    for ingredient in homeVM.purchasesArray {
                        
                        if ingredient.ingradientName == self.ingredient.ingradientName {
                            
                            var updatedIngredient = ingredient
                            
                            updatedIngredient.weightPerPortion = String(Int(ingredient.weightPerPortion)! + Int(self.ingredient.weightPerPortion)!)
                            
                            homeVM.purchasesArray[homeVM.purchasesArray.firstIndex(of: ingredient)!] = updatedIngredient
                            
                            add = true
                        }
                    }
                    
                    if add == false {
                        
                        homeVM.purchasesArray.append(self.ingredient)
                    }
                }
                else {
                    homeVM.purchasesArray.append(ingredient)
                }
                
                saveIsAdded()
                
                idsArray.append(ingredient.id)
                
                UserDefaults.standard.setValue(idsArray, forKey: ingredient.ingradientName)
                
                secondIdsArray.append(ingredient.secondId)
                
                UserDefaults.standard.setValue(secondIdsArray, forKey: ingredient.ingradientName + "!")
                
                withAnimation {addArr.append(ingredient.ingradientName)}
            } else {
                
                if homeVM.purchasesArray.count != 0 {
                    
                    var remove = false
                    
                    for ingredient in homeVM.purchasesArray {
                        
                        if ingredient.ingradientName == self.ingredient.ingradientName {
                            
                            if ingredient.weightPerPortion == self.ingredient.weightPerPortion {
                                homeVM.purchasesArray.remove(at: homeVM.purchasesArray.firstIndex(of: ingredient)!)
                                remove = true
                            }
                            else {
                                
                                var updatedIngredient = ingredient
                                
                                if Int(ingredient.weightPerPortion)! > Int(self.ingredient.weightPerPortion)! {
                                    updatedIngredient.weightPerPortion = String(Int(ingredient.weightPerPortion)! - Int(self.ingredient.weightPerPortion)!)
                                }
                                else {
                                    updatedIngredient.weightPerPortion = String(Int(self.ingredient.weightPerPortion)! - Int(ingredient.weightPerPortion)!)
                                }
                                
                                homeVM.purchasesArray[homeVM.purchasesArray.firstIndex(of: ingredient)!] = updatedIngredient
                                
                                remove = true
                            }
                        }
                    }
                    
                    if remove == false {
                        
                        homeVM.purchasesArray.remove(at: homeVM.purchasesArray.firstIndex(of: ingredient)!)
                    }
                }
                else {
                    homeVM.purchasesArray.remove(at: homeVM.purchasesArray.firstIndex(of: ingredient)!)
                }
                
                saveIsAdded()
                if nCenter {
                    idsArray.remove(at: idsArray.firstIndex(of: ingredient.id)!)
                    
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
            }
            print(addArr)
            UserDefaults.standard.setValue(addArr, forKey: homeVM.choicedRecipe.ingredients.first!.secondId)
        }
        .onAppear() {
            setIsAdded()
            
            idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
            
            secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
        }
        .onChange(of: homeVM.isPresent) { _ in
            DispatchQueue.main.async {
                setIsAdded()
            }
        }
        .onChange(of: multiplier) { _ in
            
            recoveryWeightIngredient()
            if Double(ingredient.weightPerPortion)! >= 1 {
                ingredient.weightPerPortion = String(Int(ingredient.weightPerPortion)! * multiplier)
            }
            else {
                ingredient.weightPerPortion = String(Double(ingredient.weightPerPortion)! * Double(multiplier))
                
                //                if Int(ingredient.weightPerPortion)! >= 1 {
                //                    ingredient.weightPerPortion = String(Int(ingredient.weightPerPortion)! * multiplier)
                //                }
            }
        }
    }
    
    func saveIsAdded() {
        UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
    }
    
    func setIsAdded() {
        isAddedForPurchases = UserDefaults.standard.bool(forKey: ingredient.id)
    }
    
    func recoveryWeightIngredient() {
        
        for ingredient in homeVM.choicedRecipe.ingredients {
            
            if self.ingredient.ingradientName == ingredient.ingradientName {
                
                self.ingredient = ingredient
            }
        }
    }
}

struct NewIngredientCell2: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var ingredient : Ingredient
    
    //    @State var nCenter: Bool
    
    @State var isAddedForPurchases = false
    
    @State var addArr : [String] = []
    
    var width = UIScreen.main.bounds.width
    
    @State var idsArray : [String] = []
    
    @State var secondIdsArray : [String] = []
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            //            ZStack {
            //
            //                Circle()
            //                    .fill(Color.white)
            //                    .frame(width: horizontalSizeClass != .compact ? (homeVM.choicedRecipe.ingredients.count < 9 ? width / 54 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5)) : width / 18, height: horizontalSizeClass != .compact ? width / 54 : width / 18)
            //                    .opacity(isAddedForPurchases ? 1 : 0)
            
            Image(systemName: isAddedForPurchases ? "circle" : "checkmark.circle.fill")
                .font(.system(size: horizontalSizeClass == .compact ? width / 12 : (homeVM.choicedRecipe.ingredients.count < 9 ? width / 42 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5))))
                .foregroundColor(.gray)
            //            }
            
            Text(ingredient.ingradientName)
                .font(.system(size: horizontalSizeClass == .compact ? width / 18 : (homeVM.choicedRecipe.ingredients.count < 9 ? width / 50 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5))))
                .foregroundColor(homeVM.darkTheme ? .white : .black)
            
            Spacer()
            
            Text(ingredient.weightPerPortion)
                .font(.system(size: horizontalSizeClass == .compact ? width / 20 : (homeVM.choicedRecipe.ingredients.count < 9 ? width / 66 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5))))
                .foregroundColor(homeVM.darkTheme ? .white : .secondary)
            Text(ingredient.nameForWeight)
                .font(.system(size: horizontalSizeClass == .compact ? width / 20 : (homeVM.choicedRecipe.ingredients.count < 9 ? width / 66 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5))))
                .foregroundColor(homeVM.darkTheme ? .white : .secondary)
        }
        .background(Color.white.opacity(0.000001))
        .padding(.horizontal)
        .padding(.vertical, width / 200)
        .transition(.move(edge: .trailing))
        .onTapGesture {
            if isAddedForPurchases {
                isAddedForPurchases.toggle()
                
                if !isAddedForPurchases {
                    withAnimation(.easeInOut(duration: 0.7)) {homeVM.purchasesArray.remove(at: homeVM.purchasesArray.firstIndex(of: ingredient)!)}
                    
                    saveIsAdded()
                    
                    for id in idsArray {
                        
                        UserDefaults.standard.setValue(false, forKey: id)
                    }
                    
                    idsArray.removeAll()
                    
                    UserDefaults.standard.setValue(idsArray, forKey: ingredient.ingradientName)
                    
                    for secondId in secondIdsArray {
                        
                        addArr = UserDefaults.standard.stringArray(forKey: secondId)!
                        print(addArr)
                        if addArr.contains(ingredient.ingradientName){
                            addArr.remove(at: addArr.firstIndex(of: ingredient.ingradientName)!)// wrong
                        }
                        UserDefaults.standard.setValue(addArr, forKey: secondId)
                    }
                    
                    secondIdsArray.removeAll()
                    UserDefaults.standard.setValue(secondIdsArray, forKey: ingredient.ingradientName + "!")
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.async {
                setIsAdded()
                
                idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
                
                secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
                
                isAddedForPurchases = true
            }
        }
    }
    
    func saveIsAdded() {
        UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
    }
    
    func setIsAdded() {
        isAddedForPurchases = UserDefaults.standard.bool(forKey: ingredient.id)
    }
    
    func recoveryWeightIngredient() {
        
        for ingredient in homeVM.choicedRecipe.ingredients {
            
            if self.ingredient.ingradientName == ingredient.ingradientName {
                
                self.ingredient = ingredient
            }
        }
    }
}
