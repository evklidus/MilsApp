//
//  AllRecipesToggle.swift
//  Mils
//
//  Created by Erik Minasov on 16.07.2021.
//

import SwiftUI

struct AllRecipesToggle: View {
    
    @Binding var showAllRecipes : Bool
    
    var body: some View {
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
        .padding(.vertical, 5)
    }
}
