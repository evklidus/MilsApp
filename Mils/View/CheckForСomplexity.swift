//
//  CheckForСomplexity.swift
//  Mils
//
//  Created by Erik Minasov on 02.05.2021.
//

import SwiftUI

struct CheckForComplexity: View {
//    @EnvironmentObject var homeVM: HomeViewModel
    
    var text : String
    
    var image : String
    
    var imageForTap : String
    
    @State var tapped = true
    
    @Binding var complexitysArr : [String]
    
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
                
                complexitysArr.remove(at: complexitysArr.firstIndex(of: text)!)
            }
            else {
                
                complexitysArr.append(text)
            }
        }
        .onChange(of: complexitysArr, perform: { value in
            
            if complexitysArr.contains(text) {
                
                tapped = true
            }
            else {
                tapped = false
            }
        })
    }
}
