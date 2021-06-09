//
//  RecipeInfoView.swift
//  Mils
//
//  Created by Erik Minasov on 26.02.2021.
//

import SwiftUI

struct RecipeInfoView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var width : CGFloat
    
    var image : String
    
    var text : String
    
    var bgColor : UIColor
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        VStack {
            
            Text(image)
                .font(.system(size: horizontalSizeClass == .compact ? width / 12 : width / 36))
                .foregroundColor(.white)
            
            Text(text)
                .font(.system(size: horizontalSizeClass == .compact ? width / 25 : width / 75, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 2)
        }
        .padding()
        .frame(width: horizontalSizeClass == .compact ? width / 3.8 : width / 11)
        .background(Color(bgColor))
        .cornerRadius(horizontalSizeClass == .compact ? width / 18 : width / 45)
//        .shadow(color: Color(bgColor), radius: 2, x: 0, y: 2)
    }
}
