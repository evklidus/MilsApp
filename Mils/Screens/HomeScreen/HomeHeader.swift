//
//  HomeHeader.swift
//  Mils
//
//  Created by Erik Minasov on 07.07.2021.
//

import SwiftUI

struct HomeHeader : View {
    @ObservedObject var data : OurData
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var width : CGFloat
    
    @Binding var showSmallCategories : Bool
    
    @Binding var search : String
    
    @Binding var allRecipesPresent : Bool
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            HStack {
                
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
                        .font(.system(size: width / 20))
                    
                    TextField("Поиск", text: $search, onEditingChanged: { _ in
                        
                        allRecipesPresent.toggle()
                    })
                    .foregroundColor(.black)
                    .accentColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
                    //.textContentType(.username)
                    
                    if allRecipesPresent {
                        Button(action: {
                            search = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: width / 16))
                                .foregroundColor(Color.gray.opacity(0.75))
                                .padding(.trailing, 12)
                        }
                    }
                }
                .padding(.leading, 12)
                .frame(height: width / 8)
                .background(Color.white)
                .cornerRadius(width / 30)
                .shadow(color: showSmallCategories ? Color.clear : Color.black.opacity(homeVM.darkTheme ? 0 : 0.15), radius: 10, x: 0, y: 5)
                .shadow(color: showSmallCategories ? Color.clear : Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: width / 30).stroke(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75)).opacity(showSmallCategories ? 1 : 0)
                )
                
                Spacer()
                
                if allRecipesPresent {
                    Button(action: {
                        withAnimation {
                            search = ""
                            homeVM.hideKeyboard()
                        }
                    }) {
                        Text("Отменить")
                            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.9))
                            .animation(.spring())
                    }
                }
                
                if !allRecipesPresent {
                    Button(action: {
                        
                        withAnimation {homeVM.filtersPresent = true}
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)))
                            .font(.system(size: width / 18))
                            .padding(.horizontal, 5)
                            .frame(width: width / 8, height: width / 8)
                            .background(Color.white)
                            .cornerRadius(width / 30)
                            .shadow(color: showSmallCategories ? Color.clear : Color.black.opacity(homeVM.darkTheme ? 0 : 0.15), radius: 10, x: 0, y: 5)
                            .shadow(color: showSmallCategories ? Color.clear : Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: width / 30).stroke(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75)).opacity(showSmallCategories ? 1 : 0)
                            )
                            .animation(.spring())
                    }
                }
            }
            .padding(.horizontal, width / 25)
            
            if showSmallCategories {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(data.categories) { category in
                            CategoryView(category: category, width: width, image: false)
                                .onTapGesture {
                                    withAnimation {homeVM.choicedCategory = category}
                                }
                        }
                    }
                    .padding(.leading, 10)
                }
            }
            
            Divider()
                .opacity(showSmallCategories ? 1 : 0)
        }
        .background(homeVM.darkTheme ? Color.black : Color.white)
    }
}
