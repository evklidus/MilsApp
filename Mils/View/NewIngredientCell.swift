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
    
    @Binding var allAdded : Bool
    
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
            
            homeVM.tap(ingredient: ingredient, isAddedForPurchases: &isAddedForPurchases, idsArray: &idsArray, secondIdsArray: &secondIdsArray, addArr: &addArr, allAdded: &allAdded, nCenter: nCenter)
        }
        .onAppear() {
            homeVM.setIsAdded(isAddedForPurchases: &isAddedForPurchases, ingredient: ingredient)
            
            idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
            
            secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
        }
        .onChange(of: allAdded) { value in
            DispatchQueue.main.async {
                if value {
                    isAddedForPurchases = true
                }
            }
        }
        .onChange(of: homeVM.isPresent) { _ in
            DispatchQueue.main.async {
                homeVM.setIsAdded(isAddedForPurchases: &isAddedForPurchases, ingredient: ingredient)
            }
        }
        .onChange(of: multiplier) { _ in
            
            homeVM.recoveryWeightIngredient(ingredient: &ingredient)
            if Double(ingredient.weightPerPortion)! >= 1 {
                ingredient.weightPerPortion = String(Int(ingredient.weightPerPortion)! * multiplier)
            }
            else {
                ingredient.weightPerPortion = String(Double(ingredient.weightPerPortion)! * Double(multiplier))
            }
        }
    }
}
