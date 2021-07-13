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
    
    var pad : Bool
    
    @State var addArr : [String] = []
    
    @State var allAdded = false
    
    var body: some View {
        
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
                
                NewIngredientCell(ingredient: ingredient, nCenter: true, multiplier: $multiplier, addArr:  $addArr, allAdded: $allAdded)
                    .padding(.top, 5)
            }
            
            Button {
                homeVM.addAllIngredients(allAdded: &allAdded, addArr: &addArr)
            } label: {
                Text("Добавить всё")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(homeVM.darkTheme ? .white : .white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 30)
                    .background(homeVM.darkTheme ? (allAdded ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)) : .black) : (allAdded ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)) : .black.opacity(0.75)))
                    .cornerRadius(10)
                    .padding(.top, 10)
            }
            .disabled(allAdded)
        }
        .frame(width: pad ? width / 2 : nil)
        .padding()
        .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)) : Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.3), radius: 20, x: 0, y: 10)
        .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
        .padding()
        .onChange(of: homeVM.isPresent) { _ in
            homeVM.reloadIngView(addArr: &addArr, allAdded: &allAdded)
        }
    }
}
