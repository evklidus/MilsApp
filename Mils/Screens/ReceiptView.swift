//
//  ReceiptView.swift
//  Mils
//
//  Created by Erik Minasov on 21.01.2021.
//

import SwiftUI
import CoreHaptics

struct ReceiptView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    let recipe: Recipe
    
    @State var isTapped = false
    
    var width : CGFloat
    
    @State var tapCount : Int = 0
    
    @State var addedToFavorites : Bool = false
    
    @State var up : Bool = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
//            CacheAsyncImage(
//                url: URL(string: recipe.image)!
//            ) { phase in
//                switch phase {
//                case .empty:
//                    ProgressView()
//                case .success(let image):
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
//                        .clipped()
//                        .cornerRadius(horizontalSizeClass == .compact ? width / 20 : width / 35)
//                        .onTapGesture {
//                            homeVM.choiceRecipe(recipe: recipe)
//                        }
//                        .onLongPressGesture(maximumDistance: 0.2) { inProgress in
//                            //print("In progress: \(inProgress)!")
//                        }  perform: {
//                            homeVM.saveRecipe(isTapped: &isTapped, recipe: recipe)
//                            if homeVM.bookmarskArray.contains(recipe) {
//                                addedToFavorites = true
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                    addedToFavorites = false
//                                }
//                            }
//                        }
//                case .failure(let error):
//                    Image(systemName: "photo.circle.fill")
//                        .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
//                @unknown default:
//                    fatalError()
//                }
//            }
//            .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
            AsyncImage(url: URL(string: recipe.image)) { phase in
                if let image = phase {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
                        .clipped()
                        .cornerRadius(horizontalSizeClass == .compact ? width / 20 : width / 35)
                        .onTapGesture {
                            homeVM.choiceRecipe(recipe: recipe)
                        }
                        .onLongPressGesture(maximumDistance: 0.2) { inProgress in
                            //print("In progress: \(inProgress)!")
                        }  perform: {
                            homeVM.saveRecipe(isTapped: &isTapped, recipe: recipe)
                            if homeVM.bookmarskArray.contains(recipe) {
                                addedToFavorites = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    addedToFavorites = false
                                }
                            }
                        }
                }
                else {
                    Image(systemName: "photo.circle.fill")
                        .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
                }
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(horizontalSizeClass == .compact ? width / 20 : width / 35)
                    .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5, height: horizontalSizeClass == .compact ? width / 2.7 : width / 4.7)
            }
            .overlay(
                VStack {
                    
                    HStack(alignment: .top, spacing: 3) {
                        
                        Image(systemName: "timer")
                            .font(.system(size: horizontalSizeClass == .compact ? width / 27.5 : width / 60, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("\(recipe.time) м")
                            .font(.system(size: horizontalSizeClass == .compact ? width / 27.5 : width / 60, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                        
                        ZStack {
                            Color.white.clipShape(Circle())
                                .frame(width: width / 12, height: width / 12)
                                .offset(y: width / -500)
                            
                            Image(systemName: "heart.fill")
                                .font(.system(size: width / 21))
                                .scaleEffect(up ? (isTapped ? 1.2 : 0.8) : 1)
                                .foregroundColor(isTapped ? .red : .gray)
                                .padding(width / 70)
                        }
                        .onTapGesture {
                            up = true
                            withAnimation {homeVM.saveRecipe(isTapped: &isTapped, recipe: recipe)}
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                up = false
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
                    homeVM.choiceRecipe(recipe: recipe)
                }
            }
            .padding(.horizontal,horizontalSizeClass == .compact ? 7.5 : width / 70)
            .padding(.bottom, 8)
            
            Spacer(minLength: 0)
        }
        .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5)
        .background(homeVM.darkTheme ? Color.black : Color.white)
        .cornerRadius(horizontalSizeClass == .compact ? 20 : width / 35)
        .overlay(
            ZStack {
                
                Color.black.opacity(0.25)
                    .frame(width: horizontalSizeClass == .compact ? width / 2.5 : width / 4.5)
                    .cornerRadius(horizontalSizeClass == .compact ? 20 : width / 35)
                
                Image(systemName: "heart.fill")
                    .font(.system(size: 60.0))
                    .foregroundColor(.red)
                    .padding(.bottom, 10)
            }
                .opacity(addedToFavorites ? 1 : 0)
        )
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
}
