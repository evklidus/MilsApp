//
//  AddingIngredientView.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import SwiftUI

struct CustomTextField : View {
    
    @Binding var text : String
    
    var grayText : String
    
    var body : some View {
        
        HStack(spacing: 3) {
            
            TextField(grayText, text: $text)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.black.opacity(0.05))
        .cornerRadius(10)
        .accentColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
    }
}

struct AddingIngredientView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var name : String = ""
    @State var weight : String = ""
    @State var nameForWeight : String = "г"
    
    var namesForWeight = ["г", "кг", "мл", "л", "шт"]
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            withAnimation {
                                hideKeyboard()
                                homeVM.isPresentAddingIngredient.toggle()
                                clear()
                            }
                        }) {
                            
                            Image(systemName: "xmark")
                                .font(.system(size: geo.size.width / 16, weight: .heavy))
                                .foregroundColor(.orange)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text("Добавление ингредиента")
                        .bold()
                        .font(.title3)
                        .lineLimit(1)
                }
                .padding()
                
                VStack {
                    CustomTextField(text: $name, grayText: "Название")
                    CustomTextField(text: $weight, grayText: "Вес")
//                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                    
                    Picker("", selection: $nameForWeight) {
                        ForEach(namesForWeight, id: \.self) {
                            Text($0)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
                Button(action: {
                    let ingredient = Ingredient(id: UUID().uuidString, ingradientName: name, weightPerPortion: weight, nameForWeight: nameForWeight.lowercased(), secondId: UUID().uuidString)
                    
                    homeVM.purchasesArray.append(ingredient)
                    hideKeyboard()
                    homeVM.isPresentAddingIngredient.toggle()
                    
                    clear()
                }) {
                    Text("Добавить ингредиент")
                        .foregroundColor(.orange)
                        .font(.system(size: geo.size.width / 20))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .cornerRadius(geo.size.width / 45)
                        .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.15), radius: 10, x: 0, y: 5)
                        .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
                        .padding(.bottom, 20)
                }
            }
            .background(Color.white.ignoresSafeArea())
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .frame(maxHeight: .infinity, alignment: .center)
        }
    }
    
    func clear() {
        
        name = ""
        weight = ""
        nameForWeight = ""
    }
}
