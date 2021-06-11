//
//  CardView.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var width : CGFloat
    
    var step : String
    
    var index : Int
    
    var nilImage = "https://image.freepik.com/free-vector/chefs-cooks-waiters-working-restaurant-kitchen_74855-6992.jpg"
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            WebImage(url: URL(string: homeVM.choicedRecipe.images.isEmpty ? nilImage : homeVM.choicedRecipe.images[homeVM.choicedRecipe.steps.firstIndex(of: step) ?? 0]))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width / 1.2, height: width / 2)
                .clipped()
                .background(Color.init(#colorLiteral(red: 0.8849371076, green: 0.883649528, blue: 0.9052258134, alpha: 1)))
                .cornerRadius(width / 15)
                .padding(.top, width / 30)
            
            Text(step)
                .foregroundColor(homeVM.darkTheme ? .white : .black)
//                .fontWeight(.some(Font.Weight))
                .padding(width / 22)
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
            
//            Spacer(minLength: 0)
            
            Text("\(index + 1)")
                .foregroundColor(.white)
                .bold()
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(homeVM.tapOnStep != (index < homeVM.choicedRecipe.steps.count ? homeVM.choicedRecipe.steps[index] : "Рецепт не завершен") ? Color.init(#colorLiteral(red: 1, green: 0.6752192378, blue: 0.2657106817, alpha: 1)) : Color.red)
                .cornerRadius(20, corners: .topLeft)
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        }
        .frame(width: width / 1.1)
        .background(homeVM.darkTheme ? Color.black : Color.white)
        .cornerRadius(width / 15)
        .overlay(
            RoundedRectangle(cornerRadius: width / 15)
                .stroke(homeVM.tapOnStep != (index < homeVM.choicedRecipe.steps.count ? homeVM.choicedRecipe.steps[index] : "Рецепт не завершен") ? (homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)) : Color.init(#colorLiteral(red: 0.8849371076, green: 0.883649528, blue: 0.9052258134, alpha: 1))) : Color.red, lineWidth: 3)
        )
        .padding(width / 30)
    }
}

//LinearGradient(gradient: Gradient(colors: [Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)), Color.blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
