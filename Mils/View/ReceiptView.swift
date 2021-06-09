//
//  ReceiptView.swift
//  Mils
//
//  Created by Erik Minasov on 21.01.2021.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreHaptics

struct ReceiptView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var recipe: Recipe
    
    @State var isTapped = false
    
    var width : CGFloat
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            WebImage(url: URL(string: recipe.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
                .clipped()
                //  .background(Color.init(#colorLiteral(red: 0.8849371076, green: 0.883649528, blue: 0.9052258134, alpha: 1)))
                .cornerRadius(horizontalSizeClass == .compact ? width / 20 : width / 35)
                .onTapGesture {
                    DispatchQueue.main.async {
                        homeVM.choicedRecipe = recipe
                    }
                    withAnimation {homeVM.isPresent.toggle()}
                    withAnimation {hideKeyboard()}
                }
//                .onTapGesture(count: 2) {
//                    withAnimation {saveRecipe()}
//                }
                .overlay(
                    VStack {
                        
                        HStack(alignment: .top, spacing: 3) {
                            
                            Image(systemName: "timer")
                                .font(.system(size: horizontalSizeClass == .compact ? width / 27.5 : width / 60, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(recipe.time)
                                .font(.system(size: horizontalSizeClass == .compact ? width / 27.5 : width / 60, weight: .bold))
                                .foregroundColor(.white)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                                withAnimation {saveRecipe()}
                            }) {
                                ZStack {
                                    Color.white.clipShape(Circle())
                                        .frame(width: width / 12, height: width / 12)
                                        .offset(y: width / -500)
                                    
                                    Image(systemName: "heart.fill")
                                        .scaleEffect(horizontalSizeClass == .compact ? 1.1 : 1.5)
                                        .foregroundColor(isTapped ? Color.red : Color.gray)
                                        .padding(width / 70)
                                }
                            }
                        }
                        .padding(.horizontal, horizontalSizeClass == .compact ? width / 40 : width / 80)
                        .padding(.top, horizontalSizeClass == .compact ? width / 40 : width / 65)
                        
                        Spacer()
                    }
                )
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .foregroundColor(homeVM.darkTheme ? .white : Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)))
                        .fontWeight(.bold)
                        .font(.system(size: horizontalSizeClass == .compact ? width / 28 : width / 48))
                        .multilineTextAlignment(.leading)
                    
                    Text("\(recipe.kcal) ккал")
                        .foregroundColor(homeVM.darkTheme ? Color.white.opacity(0.6) : .gray)
                        .font(.system(size: horizontalSizeClass == .compact ? width / 30 : width / 54))
                        .multilineTextAlignment(.leading)
                }
                .onTapGesture {
                    homeVM.choicedRecipe = recipe
                    withAnimation {homeVM.isPresent.toggle()}
                    withAnimation {hideKeyboard()}
                }
            }
            .padding(.horizontal,horizontalSizeClass == .compact ? 7.5 : width / 70)
            .padding(.bottom, 8)
        }
        .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(homeVM.darkTheme ? Color.black : Color.white)
        .cornerRadius(horizontalSizeClass == .compact ? 20 : width / 35)
        .onAppear() {
            DispatchQueue.main.async {
                isTapped = UserDefaults.standard.bool(forKey: recipe.name)
            }
        }
        .onChange(of: homeVM.isPresent, perform: { value in
            DispatchQueue.main.async {
                isTapped = UserDefaults.standard.bool(forKey: recipe.name)
            }
        })
        
    }
    
    func saveRecipe() {
//        DispatchQueue.main.async {
            isTapped.toggle()
            
            if isTapped == true {
                
                homeVM.bookmarskArray.append(recipe)
                simpleSuccess(style: .rigid)
            } else {
                
                for deleteRecipe in homeVM.bookmarskArray {
                    
                    if deleteRecipe.name == self.recipe.name {
                        
                        let index = homeVM.bookmarskArray.firstIndex(of: deleteRecipe)
                        homeVM.bookmarskArray.remove(at: index!)
                    }
                }
            }
            
            UserDefaults.standard.setValue(isTapped, forKey: recipe.name)
            isTapped = UserDefaults.standard.bool(forKey: recipe.name)
//        }
    }
    
    func simpleSuccess(style: UIImpactFeedbackGenerator.FeedbackStyle) {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
