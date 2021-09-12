//
//  ScrollButton.swift
//  Mils
//
//  Created by Erik Minasov on 08.03.2021.
//

import SwiftUI

struct ScrollButton : View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var width : CGFloat
    
    var pad : Bool
    
    var body: some View {
        
        if pad {
            
            HStack(spacing: width / 50) {
                
                Text("Начать готовить")
                    .font(.system(size: width / 65))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.system(size: width / 75))
                    .foregroundColor(.white)
            }
            .padding(.vertical, width / 70)
            .padding(.horizontal)
            .background(homeVM.tapOnStep != "notTapped" ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)) : Color.init(#colorLiteral(red: 1, green: 0.7037059665, blue: 0.1468696296, alpha: 1)))
            .opacity(homeVM.tapOnStep != "notTapped" ? 0.6 : 1)
            .cornerRadius(width / 65)
            .shadow(color: Color.orange.opacity(homeVM.darkTheme || homeVM.tapOnStep != "notTapped" ? 0 : 0.6), radius: 10, x: 0, y: 5)
            .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 3, x: 0, y: 2)
            .padding(.horizontal, width / 25)
            .padding(.top, width / 50)
        }
        
        else {
        
        HStack(spacing: width / 35) {
            
            Text("Начать готовить")
                .font(.system(size: width / 22))
                .foregroundColor(.white)
                .fontWeight(.heavy)
            
//            Image(systemName: "arrowtriangle.down.fill")
//                .font(.system(size: width / 32))
//                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, width / 35)
        .background(homeVM.tapOnStep != "notTapped" ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)) : Color.init(#colorLiteral(red: 1, green: 0.7037059665, blue: 0.1468696296, alpha: 1)))
        .opacity(homeVM.tapOnStep != "notTapped" ? 0.6 : 1)
        .cornerRadius(width / 30)
        .shadow(color: Color.orange.opacity(homeVM.darkTheme || homeVM.tapOnStep != "notTapped" ? 0 : 0.3), radius: 10, x: 0, y: 5)
        .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal, width / 5)
        .padding(.top, width / 30)
        }
    }
}

