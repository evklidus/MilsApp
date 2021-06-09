//
//  IngredientsView.swift
//  Mils
//
//  Created by Erik Minasov on 21.02.2021.
//

import SwiftUI

struct IngredientsView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var width : CGFloat
    
    @State var multiplier : Int = 1 {
        
        didSet {
            
            if multiplier <= 0 {
                
                multiplier = 1
            }
        }
    }
    
    var fullRecipe : Bool
    
    var pad : Bool
    
    @State var addArr : [String] = []
   
    var body: some View {
        
        if fullRecipe {
            
            VStack {
                
                HStack {
                    Text("Ингредиенты")
                        .foregroundColor(homeVM.darkTheme ? .white : .black)
                        .fontWeight(.bold)
                        .font(.system(size: pad ? width / 54 : width / 18))
                        .frame(height: pad ? width / 36 : width / 12)
                    
                    Spacer()
                    
                    if addArr.count == 0 {
                        Text(String(multiplier))
                            .font(.system(size: pad ? width / 54 : width / 18))
                            .foregroundColor(homeVM.darkTheme ? .white : .black)
                            .fontWeight(.bold)
                        
                        Stepper("", value: $multiplier, in: 1...100)
                            .colorScheme(homeVM.darkTheme ? .dark : .light)
                            .labelsHidden()
                            .frame(height: pad ? width / 36 : width / 12)
                    }
                }
                
                ForEach(homeVM.choicedRecipe.ingredients, id: \.self) { ingredient in
                    
                    NewIngredientCell(ingredient: ingredient, nCenter: true, multiplier: $multiplier, addArr:  $addArr)
                }
                .padding(.top)
            }
            .frame(width: pad ? width / 2 : nil)
            .padding()
            .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)) : Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.3), radius: 20, x: 0, y: 10)
            .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
            .padding()
            .onChange(of: homeVM.isPresent) { _ in
                DispatchQueue.main.async {
                    addArr = UserDefaults.standard.stringArray(forKey: homeVM.choicedRecipe.ingredients.first!.secondId) ?? []
                }
            }
        }
        
        else {
            
            ForEach(homeVM.purchasesArray, id: \.self) { ingredient in
                
                NewIngredientCell(ingredient: ingredient, nCenter: false, multiplier: $multiplier, addArr: $addArr)
            }
            .padding(.horizontal)
        }
    }
}
