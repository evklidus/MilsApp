//
//  StepView.swift
//  Mils
//
//  Created by Erik Minasov on 09.04.2021.
//

import SwiftUI

struct StepView : View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var width : CGFloat
    
    var step : String
    
    @State private var rect1: CGRect = CGRect()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var tapped = false
    
    var body: some View {
        
        if horizontalSizeClass == .compact {
            
            HStack(alignment: .top) {
                
                VStack(spacing: width / 75) {
                    
                    if homeVM.choicedRecipe.steps.firstIndex(of: step) != nil {
                        
                        Text("\(homeVM.choicedRecipe.steps.firstIndex(of: step)! + 1)")
                            .font(.system(size: width / 20))
                            .foregroundColor(homeVM.darkTheme ? (homeVM.tapOnStep == step ? Color.red.opacity(0.8) : .white) : (homeVM.tapOnStep == step ? Color.red.opacity(0.8) : .black))
                            .fontWeight(.bold)
                            .frame(width: width / 20, height: width / 20)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(homeVM.tapOnStep == step ? Color.red.opacity(0.8) : Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)), lineWidth: width / 130)
                            )
                        
                        if homeVM.choicedRecipe.steps.count != homeVM.choicedRecipe.steps.firstIndex(of: step)! + 1 {
                            Capsule()
                                .foregroundColor(.gray)
                                .frame(width: 5, height: rect1.height)
                                .padding(.top, width / 65)
                        }
                    }
                }
                
                Text(step)
                    .font(.system(size: width / 25))
                    .foregroundColor(homeVM.darkTheme ? .white : .black)
                    .multilineTextAlignment(.leading)
                    .padding(width / 50)
                    .overlay(Color.red.opacity(homeVM.tapOnStep == step ? 0.3 : 0).cornerRadius(width / 35))
                    .overlay(Color.clear.modifier(GeometryGetterMod(rect: $rect1)))
                
            }
            .padding(width / 240)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        else {
            
            HStack(alignment: .top) {
                
                VStack {
                    
                    if homeVM.choicedRecipe.steps.firstIndex(of: step) != nil {
                        
                        Text("\(homeVM.choicedRecipe.steps.firstIndex(of: step)! + 1)")
                            .font(.system(size: width / 40))
                            .foregroundColor(homeVM.darkTheme ? (homeVM.tapOnStep == step ? Color.red.opacity(0.8) : .white) : (homeVM.tapOnStep == step ? Color.red.opacity(0.8) : .black))
                            .fontWeight(.bold)
                            .frame(width: width / 40, height: width / 40)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(homeVM.tapOnStep == step ? Color.red.opacity(0.8) : Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)), lineWidth: width / 300)
                            )
                        
                        if homeVM.choicedRecipe.steps.count != homeVM.choicedRecipe.steps.firstIndex(of: step)! + 1 {
                            Capsule()
                                .foregroundColor(.gray)
                                .frame(width: 5, height: rect1.height)
                        }
                    }
                }
                
                Text(step)
                    .font(.system(size: width / 45))
                    .foregroundColor(homeVM.darkTheme ? .white : .black)
                    .multilineTextAlignment(.leading)
                    .padding(width / 150)
                    .overlay(Color.red.opacity(homeVM.tapOnStep == step ? 0.3 : 0).cornerRadius(width / 100))
                    .overlay(Color.clear.modifier(GeometryGetterMod(rect: $rect1)))
                
            }
            .padding(width / 240)
        }
    }
}

struct GeometryGetterMod: ViewModifier {
    
    @Binding var rect: CGRect
    
    func body(content: Content) -> some View {
        return GeometryReader { (g) -> Color in // (g) -> Content in - is what it could be, but it doesn't work
            DispatchQueue.main.async { // to avoid warning
                self.rect = g.frame(in: .global)
            }
            return Color.clear // return content - doesn't work
        }
    }
}
