//
//  TabBar.swift
//  Mils
//
//  Created by Erik Minasov on 17.01.2021.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var data : OurData
    
    @EnvironmentObject var homeVM: HomeViewModel
    @State var current = "Главное"
    
    var width : CGFloat {
        get {
            return UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
        }
    }
    
    var height : CGFloat {
        get {
            return UIScreen.main.bounds.width < UIScreen.main.bounds.height ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
        }
    }
    
    var device = UIDevice.current.userInterfaceIdiom
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            //            if device == .phone {
            
            TabView(selection: $current) {
                
                Home(data: data)
                    .tag("Главное")
//                    .animation(.easeIn(duration: 5))
                
                FavouriteView()
                    .tag("Избранное")
                
                PurchasesView()
                    .tag("Покупки")
                
                Settings()
                    .tag("Настройки")
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack(spacing: 0) {
                
                Divider()
                
                HStack(spacing: 0) {
                    
                    ForEach(tabs, id: \.self) { tab in
                        
                        TabButton(title: tab.name, image1: tab.image1, image2: tab.image2, current: $current)
                        
                        if tab != tabs.last {
                            
                            Spacer(minLength: 0)
                        }
                    }
                }
                .padding(.horizontal, width / 3.5 / CGFloat(tabs.count))
                .padding(.vertical, 5)
                .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)).ignoresSafeArea() : Color.white.ignoresSafeArea())
                .ignoresSafeArea()
            }
        }
        .ignoresSafeArea(.keyboard)
        .preferredColorScheme(homeVM.darkTheme ? .dark : .light)
        .onAppear(){
            DispatchQueue.main.async {
                UITabBar.appearance().isHidden = true
                homeVM.choicedCategory = data.categories.first!
                
                for category in data.categories {
                    
                    homeVM.allRecipes.append(contentsOf: category.recipes)
                }
            }
        }
        .overlay(
            FullReceiptView(recipe: $homeVM.choicedRecipe)
                .offset(y: homeVM.isPresent ? 0 : height)
        )
        .overlay(
            AddingIngredientView()
                .frame(width: width / 1.1, height: height / 2)
                .background(
                    Color.black.ignoresSafeArea().frame(width: width, height: height).opacity(homeVM.isPresentAddingIngredient ? 0.3 : 0)
                        .onTapGesture {
                            withAnimation {homeVM.isPresentAddingIngredient.toggle()}
                            homeVM.hideKeyboard()
                        }
                )
                .opacity(homeVM.isPresentAddingIngredient ? 1 : 0)
        )
        .overlay(
            FiltersView()
                .frame(height: height / 1.15)
                .background(
                    Color.black.ignoresSafeArea().frame(width: width, height: height).opacity(homeVM.filtersPresent ? 0.3 : 0)
                        .onTapGesture {
                            withAnimation {homeVM.filtersPresent.toggle()}
                            withAnimation {hideKeyboard()}
                        }
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.keyboard, edges: .bottom)
        )
    }
}

struct Tab: Hashable {
    let name : String
    let image1 : String
    let image2 : String
}

var tabs = [
    Tab(name: "Главное", image1: "house.fill", image2: "house"),
    Tab(name: "Избранное", image1: "heart.fill", image2: "heart"),
    Tab(name: "Покупки", image1: "cart.fill", image2: "cart"),
    Tab(name: "Настройки", image1: "gearshape.fill", image2: "gearshape"),
]
