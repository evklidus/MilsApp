//
//  CheckForСomplexity.swift
//  Mils
//
//  Created by Erik Minasov on 02.05.2021.
//

import SwiftUI

struct CheckBox: View {
//    @EnvironmentObject var homeVM: HomeViewModel
    
    var text : String
    
    var image : String = "square"
    
    var imageForTap : String = "checkmark.square"
    
    @State var tapped = true
    
    @Binding var arr : [String]
    
    var body: some View {
        
        HStack {
            
            Image(systemName: tapped ? imageForTap : image)
//                .foregroundColor(.orange)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .foregroundColor(.orange)
            
            Text(text)
                .font(.system(size: 20))
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.horizontal)
        .onTapGesture {
            
            tapped.toggle()
            
            if !tapped {
                
                arr.remove(at: arr.firstIndex(of: text)!)
            }
            else {
                
                arr.append(text)
            }
        }
        .onChange(of: arr, perform: { value in
            
            if arr.contains(text) {
                
                tapped = true
            }
            else {
                tapped = false
            }
        })
    }
}
