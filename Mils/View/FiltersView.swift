//
//  FiltersView.swift
//  Mils
//
//  Created by Erik Minasov on 28.04.2021.
//

import SwiftUI

struct CustomTextFieldForFilters : View {
    
    @Binding var text : String
    
    var grayText : String
    
    var supportText : String
    
    var body : some View {
        
        HStack(spacing: 3) {
            Text(supportText)
                .foregroundColor(.gray)
            
            TextField(grayText, text: $text)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.black.opacity(0.05))
        .cornerRadius(10)
        .accentColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
    }
}

struct FiltersView: View {
    @EnvironmentObject var homeVM : HomeViewModel
    
    @State var caloriesStart : String = "0"
    
    @State var caloriesEnd : String = "600"
    
    @State var editing : Bool = false
    
    @State var showAllRecipes : Bool = false
    
    @State var offset: CGSize = CGSize.zero
    
    @State var complexitysArr : [String] = ["легко", "средне", "сложно"]
    
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
                
                HStack {
                    
                    Text("Показать все рецепты")
                        .foregroundColor(.black)
                        .font(.callout)
                    
                    Spacer()
                    
                    Toggle(isOn: withAnimation {$showAllRecipes}) {Text("")}
                        .toggleStyle(SwitchToggleStyle(tint: Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1))))
                        .labelsHidden()
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.black.opacity(0.05))
                .cornerRadius(14)
                
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
                .padding(.bottom, 5)
                
                VStack {
                    
                    Text("Сложность")
                        .font(.callout)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CheckForComplexity(text: "легко", image: "square", imageForTap: "checkmark.square", complexitysArr: $complexitysArr)
                    CheckForComplexity(text: "средне", image: "square", imageForTap: "checkmark.square", complexitysArr: $complexitysArr)
                    CheckForComplexity(text: "сложно", image: "square", imageForTap: "checkmark.square", complexitysArr: $complexitysArr)
                }
            }
            
            Button(action: {
                if editing {
                    
                    homeVM.caloriesStart = Int(caloriesStart)!
                    homeVM.caloriesEnd = Int(caloriesEnd)!
                    homeVM.showAllRecipes = showAllRecipes
                    homeVM.complexitysArr = complexitysArr
                    
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
                    .padding()
            }
        }
        .background(Color.white.cornerRadius(20).ignoresSafeArea())
        .offset(y: homeVM.filtersPresent ? 0 : height)
        .offset(y: offset.height)
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
        .onChange(of: homeVM.filtersPresent, perform: { value in
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
    }
}
