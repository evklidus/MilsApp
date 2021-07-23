//
//  FiltersView.swift
//  Mils
//
//  Created by Erik Minasov on 28.04.2021.
//

import SwiftUI

struct FiltersView: View {
    @EnvironmentObject var homeVM : HomeViewModel
    
    @State var caloriesStart : String = "0"
    
    @State var caloriesEnd : String = "600"
    
    @State var editing : Bool = false
    
    @State var showAllRecipes : Bool = false
    
    @State var offset: CGSize = CGSize.zero
    
    @State var complexitysArr : [String] = ["легко", "средне", "сложно"]
    
    @State var timesArr : [String] = ["быстро", "средне", "долго"]
    
    @State var costsArr : [String] = ["дешево", "средне", "дорого"]
    
    var height : CGFloat {
        
        get {
            return UIScreen.main.bounds.width < UIScreen.main.bounds.height ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
        }
    }
    
    var body: some View {
        
        VStack {
            
            Capsule()
                .fill(Color.gray)
                .frame(width: 60, height: 4)
                .padding(.vertical, 10)
            
            ZStack {
                
                Text("Фильтры")
                    .font(.callout)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {homeVM.filtersPresent = false}
                        withAnimation {homeVM.hideKeyboard()}
                    }) {
                        
                        Text("Отменить")
                            .font(.callout)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            List {
                    
                AllRecipesToggle(showAllRecipes: $showAllRecipes)
//                    .onChange(of: geo.frame(in: .local).minY) { value in
//                        DispatchQueue.main.async {
//
//                            if value < 0 {
//
//                                homeVM.filtersPresent = false
//                            }
//                            print(value)
//                        }
//                    }
                    
                    VStack {
                        
                        Text("Калории")
                            .font(.callout)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            CustomTextFieldForFilters(text: $caloriesStart, grayText: "0", supportText: "от")
                            CustomTextFieldForFilters(text: $caloriesEnd, grayText: "600", supportText: "до")
                        }
                        
                        //                    Slider(value: $calories, in: 0...600, step: 1)
                    }
                    .padding(.vertical, 5)
                    
                    CheckBoxes(arr: $complexitysArr, text: "Сложность", textsForCheck: ["легко", "средне", "сложно"])
                    
                    CheckBoxes(arr: $timesArr, text: "Время", textsForCheck: ["быстро", "средне", "долго"])
                    
                    CheckBoxes(arr: $costsArr, text: "Цена", textsForCheck: ["дешево", "средне", "дорого"])
//                }
            }
            .listStyle(PlainListStyle())
            
            Button(action: {
                if editing {
                    
                    homeVM.caloriesStart = Int(caloriesStart)!
                    homeVM.caloriesEnd = Int(caloriesEnd)!
                    homeVM.showAllRecipes = showAllRecipes
                    homeVM.complexitysArr = complexitysArr
                    homeVM.timesArr = timesArr
                    homeVM.costsArr = costsArr
                    
                    withAnimation {homeVM.filtersPresent = false}
                }
                else {
                    withAnimation {homeVM.filtersPresent = false}
                }
            }) {
                
                Text(editing ? "Применить" : "Закрыть")
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.orange)
                    .cornerRadius(14)
                    .padding([.horizontal, .bottom])
                    .padding(.top, 5)
            }
        }
        .background(Color.white.cornerRadius(20).ignoresSafeArea())
        .offset(y: homeVM.filtersPresent ? 0 : height)
//        .offset(y: offset.height)
//        .gesture(
//            DragGesture()
//                .onChanged { gesture in
//                    self.offset = gesture.translation
//                }
//                .onEnded { _ in
//                    if offset.height > 100 {
//                        withAnimation {homeVM.filtersPresent = false}
////                        self.offset = .zero
//                    } else {
//                        self.offset = .zero
//                    }
//                }
//        )
        .onChange(of: homeVM.filtersPresent, perform: { value in //
            withAnimation {editing = false}
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if value == false {
                    
                    if showAllRecipes != homeVM.showAllRecipes {
                        showAllRecipes = homeVM.showAllRecipes
                    }
                    if caloriesStart != String(homeVM.caloriesStart) {
                        caloriesStart = String(homeVM.caloriesStart)
                    }
                    if caloriesEnd != String(homeVM.caloriesEnd) {
                        caloriesEnd = String(homeVM.caloriesEnd)
                    }
                    if complexitysArr != homeVM.complexitysArr {
                        complexitysArr = homeVM.complexitysArr
                    }// timesArr
                    if timesArr != homeVM.timesArr {
                        timesArr = homeVM.timesArr
                    }
                    if costsArr != homeVM.costsArr {
                        costsArr = homeVM.costsArr
                    }
                }
            }
        })
        .onChange(of: showAllRecipes, perform: { value in
            withAnimation {editing = true}
        })
        .onChange(of: caloriesStart, perform: { value in
            withAnimation {editing = true}
        })
        .onChange(of: caloriesEnd, perform: { value in
            withAnimation {editing = true}
        })
        .onChange(of: complexitysArr, perform: { value in
            withAnimation {editing = true}
        })
        .onChange(of: timesArr, perform: { value in
            withAnimation {editing = true}
        })
        .onChange(of: costsArr, perform: { value in
            withAnimation {editing = true}
        })
    }
}
