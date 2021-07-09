//
//  PurchasesView.swift
//  Mils
//
//  Created by Erik Minasov on 25.01.2021.
//

import SwiftUI
struct RedMenu: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .foregroundColor(.red)
    }
}
struct PurchasesView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    @State private var isAdded = false
    
    @State private var multiplier = 1
    
    @State var add = 0
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                HStack {
                    Text("Покупки")
                        .foregroundColor(homeVM.darkTheme ? .white : .black)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Spacer(minLength: 0)
                    
                    Menu (content: {
                        
                        Section {
                            Button(action: {
                                withAnimation {homeVM.isPresentAddingIngredient = true}
                            }) {
                                Label("Добавить", systemImage: "plus")
                            }
                        }
                        
                        Section {
                            Button(action: {
                                
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
                            }) {
                                Label {
                                    Text("Очистить")
                                        .foregroundColor(.red)// not work
                                } icon: {
                                    Image(systemName: "trash.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        }) {
                            
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundColor(.orange)
                                .font(.system(size: geo.size.width / 15))
                        }
                }
                .padding([.horizontal, .top])
                
                List(homeVM.purchasesArray, id: \.self) { ingredient in
                    
                    NewIngredientCell2(ingredient: ingredient)
                        .swipeActions(allowsFullSwipe: true) {
                            
                            Button(role: .destructive) {
                                NewIngredientCell2(ingredient: ingredient).deleteIngredient()
                            } label: {
                                Label("Trash", systemImage: "trash.fill")
                            }

                        }
                }
                
                Spacer()
            }
            .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
        }
    }
}
