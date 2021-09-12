//
//  CustomTextField.swift
//  Mils
//
//  Created by Erik Minasov on 16.07.2021.
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
