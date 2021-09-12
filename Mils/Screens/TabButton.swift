//
//  TabButton.swift
//  Mils
//
//  Created by Erik Minasov on 17.01.2021.
//

import SwiftUI

struct TabButton: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var title : String
    @State var image1 : String
    @State var image2 : String
    
    @Binding var current: String
    
    var body: some View {
        
        if title != "Покупки" {
            
            Button(action: {
                
                withAnimation {current = title}
            }) {
                
                VStack {
                    
                    Image(systemName: current == title ? image1 : image2)
                    //                    .foregroundColor(current == title ? Color.white : Color.white.opacity(0.8))
                        .foregroundColor(current == title ? (homeVM.darkTheme ? .white : Color.orange) : (homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)).opacity(0.75) : Color.secondary.opacity(0.8)))
                        .font(.system(size: 25))
                    
                    Text(title)
                        .foregroundColor(current == title ? (homeVM.darkTheme ? .white : Color.orange) : (homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)).opacity(0.75) : Color.secondary.opacity(0.8)))
                        .font(.system(size: 15))
                }
            }
        }
        else {
            
            Button(action: {
                
            }) {
                
                VStack {
                    
                    Image(systemName: current == title ? image1 : image2)
                    //                    .foregroundColor(current == title ? Color.white : Color.white.opacity(0.8))
                        .foregroundColor(current == title ? (homeVM.darkTheme ? .white : Color.orange) : (homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)).opacity(0.75) : Color.secondary.opacity(0.8)))
                        .font(.system(size: 25))
                    
                    Text(title)
                        .foregroundColor(current == title ? (homeVM.darkTheme ? .white : Color.orange) : (homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)).opacity(0.75) : Color.secondary.opacity(0.8)))
                        .font(.system(size: 15))
                }
            }
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.75, maximumDistance: 1.5).onEnded { _ in
                withAnimation {homeVM.isPresentAddingIngredient = true}
            })
            .simultaneousGesture(TapGesture().onEnded {
                withAnimation {current = title}
            })
        }
    }
}
