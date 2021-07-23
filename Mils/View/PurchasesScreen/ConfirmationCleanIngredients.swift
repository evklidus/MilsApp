//
//  ConfirmationCleanIngredients.swift
//  Mils
//
//  Created by Erik Minasov on 17.05.2021.
//

import SwiftUI

struct ConfirmationCleanIngredients : View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var text : String
    
//    var funcForButton : ()
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Spacer()
            
            Text(text)
                .font(.system(size: 19, weight: .medium, design: .default))
                .foregroundColor(.red)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.white.cornerRadius(14))
                .padding(.horizontal, 10)
                .onTapGesture {
                    deleteIngredients()
                    withAnimation {
                        homeVM.confirmationCleanIngredients = false
                    }
                }
            
            Text("Отменить")
                .font(.system(size: 19, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.white.cornerRadius(14))
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation {
                        homeVM.confirmationCleanIngredients = false
                    }
                }
        }
    }
    
    func deleteIngredients() {
        for ingredient in homeVM.purchasesArray {
            
            var isAddedForPurchases = false
            
            var addArr : [String] = []
            
            var idsArray : [String] = []
            
            var secondIdsArray : [String] = []
            
            isAddedForPurchases = UserDefaults.standard.bool(forKey: ingredient.id)
            
            idsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName) ?? []
            
            secondIdsArray = UserDefaults.standard.stringArray(forKey: ingredient.ingradientName + "!") ?? []
            
            isAddedForPurchases = true
            
            UserDefaults.standard.setValue(isAddedForPurchases, forKey: ingredient.id)
            
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
        
        withAnimation {homeVM.purchasesArray.removeAll()}
    }
}
