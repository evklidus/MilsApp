//
//  IngredientCellForPurchases.swift
//  Mils
//
//  Created by Erik Minasov on 13.07.2021.
//

import SwiftUI

struct IngredientCellForPurchases: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var ingredient : Ingredient
    
    @State var isAddedForPurchases = false
    
    @State var addArr : [String] = []
    
    var width = UIScreen.main.bounds.width
    
    @State var idsArray : [String] = []
    
    @State var secondIdsArray : [String] = []
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            Image(systemName: isAddedForPurchases ? "circle" : "checkmark.circle.fill")
                .font(.system(size: horizontalSizeClass == .compact ? width / 12 : (homeVM.choicedRecipe.ingredients.count < 9 ? width / 42 : width / CGFloat(homeVM.choicedRecipe.ingredients.count * 5))))
                .foregroundColor(.gray)
            
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
        .background(Color.white.opacity(0.000001).cornerRadius(30))
        .onTapGesture {
            deleteIngredient()
        }
        .onAppear() {
            DispatchQueue.main.async {
                UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
                
                idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
                
                secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
                
                isAddedForPurchases = true
            }
        }
    }
    
    func deleteIngredient() {
        
        if isAddedForPurchases {
            isAddedForPurchases.toggle()
            
            if !isAddedForPurchases {
                withAnimation {homeVM.purchasesArray.remove(at: homeVM.purchasesArray.firstIndex(of: ingredient)!)}
                
                UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
                
                for id in idsArray {
                    
                    UserDefaults.standard.setValue(false, forKey: id)
                }
                
                idsArray.removeAll()
                
                UserDefaults.standard.setValue(idsArray, forKey: ingredient.ingradientName)
                
                for secondId in secondIdsArray {
                    
                    addArr = UserDefaults.standard.stringArray(forKey: secondId)!
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
}
