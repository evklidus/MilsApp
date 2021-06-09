//
//  BookmarksView.swift
//  Mils
//
//  Created by Erik Minasov on 24.01.2021.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    //    var width = UIScreen.main.bounds.width
    //    var height = UIScreen.main.bounds.height
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if horizontalSizeClass == .compact {
            
            GeometryReader { geo in
                ScrollView {
                    
                    HStack {
                        Text("Избранное")
                            .foregroundColor(homeVM.darkTheme ? .white : .black)
                            .font(.largeTitle)
                            .fontWeight(.heavy)

                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 2), spacing:  25) {
                            ForEach(homeVM.bookmarskArray) { recipe in
                                
                                ReceiptView(recipe: recipe, width: geo.size.width)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: geo.size.width / 6)
                    }
                    
                    Spacer()
                }
                .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
            }
        }
        
        
        else {
            
            GeometryReader { geo2 in
                
                VStack {
                    
                    HStack {
                        Text("Избранное")
                            .foregroundColor(homeVM.darkTheme ? .white : .black)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 50), count: 4), spacing:  50) {
                            ForEach(homeVM.bookmarskArray) { recipe in
                                
                                ReceiptView(recipe: recipe, width: geo2.size.width)
                            }
                        }
                        .padding()
                        .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: geo2.size.width / 6)
                    }
                    
                    Spacer()
                }
                .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
            }
        }
    }
}
