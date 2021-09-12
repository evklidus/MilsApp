//
//  CheckBoxForFilter.swift
//  Mils
//
//  Created by Erik Minasov on 16.07.2021.
//

import SwiftUI

struct CheckBoxes: View {
    
    @Binding var arr : [String]
    
    var text : String
    
    var textsForCheck : [String]
    
    var body: some View {
        VStack {
            
            Text(text)
                .font(.callout)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(textsForCheck, id: \.self) {
                CheckBox(text: $0, arr: $arr)
            }
        }
        .padding(.vertical, 5)
    }
}
