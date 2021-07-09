//
//  EnergyValueView.swift
//  Mils
//
//  Created by Erik Minasov on 26.02.2021.
//

import SwiftUI

struct EnergyValueView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var width : CGFloat
    
    var text : String
    
    var value : String
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            Text(text)
                .font(.system(size: horizontalSizeClass == .compact ? width / 33 : width / 72.5))
                .foregroundColor(homeVM.darkTheme ? .white : .secondary)
            
            Text(value)
                .font(.system(size: horizontalSizeClass == .compact ? width / 22 : width / 55, weight: .bold))
                .foregroundColor(homeVM.darkTheme ? (text == "ккал" ? .pink : .white) : (text == "ккал" ? .red.opacity(0.75) : .black))
        }
        .padding(.horizontal, horizontalSizeClass == .compact ? width / 40 : width / 180)
        .padding(.vertical, horizontalSizeClass == .compact ? width / 50 : width / 150)
        .frame(width: horizontalSizeClass == .compact ? width / 5 : width / 13.5)
        .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)) : (text == "ккал" ? .red.opacity(0.1) : .black.opacity(0.075)))
        .cornerRadius(horizontalSizeClass == .compact ? width / 35 : width / 87.5)
    }
}
