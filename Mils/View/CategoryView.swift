//
//  CategoryView.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var category: Category
    
    var width : CGFloat
    
    var image : Bool = true
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        LazyVStack {
            
            if image {
                
                WebImage(url: URL(string: category.image))
                    .resizable()
                    .frame(width: horizontalSizeClass == .compact ? width / 6 : width / 11, height: horizontalSizeClass == .compact ? width / 6 : width / 11)
                    .animation(.interpolatingSpring(stiffness: 10, damping: 3))
            }
            
            Text(category.name)
                .fontWeight(.bold)
                .foregroundColor(homeVM.darkTheme ? .white : .black)
                .font(horizontalSizeClass == .compact ? .system(size: width / 30) : .system(size: width / 65))
                .multilineTextAlignment(.center)
//                .textCase(.uppercase)
                .padding(.horizontal, width / 60)
        }
        .frame(width: horizontalSizeClass == .compact ? width / 3.5 : width / 7, height: horizontalSizeClass == .compact ? (image ? width / 2.8 : width / 8) : width / 6)
        .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.5) : (homeVM.choicedCategory.name == category.name ? Color.init(#colorLiteral(red: 1, green: 0.9173295379, blue: 0.8, alpha: 1)).opacity(0.5) : Color.white))
        .cornerRadius(horizontalSizeClass == .compact ? (image ? width / 15 : width / 25): width / 30)
        .overlay(
            RoundedRectangle(cornerRadius: horizontalSizeClass == .compact ? (image ? width / 15 : width / 25) : width / 30)
                .stroke(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)) : (homeVM.choicedCategory.name == category.name ? Color.init(#colorLiteral(red: 1, green: 0.6752192378, blue: 0.2657106817, alpha: 1)) : Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1))), lineWidth: homeVM.darkTheme ? (homeVM.choicedCategory.name == category.name ? (horizontalSizeClass == .compact ? width / 180 : width / 500) : 0) : (horizontalSizeClass == .compact ? width / 160 : width / 320))
        )
        .padding(8)
        .padding(.horizontal, horizontalSizeClass == .compact ? 0 : 10)
    }
}

//Color.init(#colorLiteral(red: 0.774099052, green: 0.8624504209, blue: 0.7614735961, alpha: 1)) классный цвет
//Color.init(#colorLiteral(red: 0.886520803, green: 0.7171490788, blue: 0.6354066133, alpha: 1))
