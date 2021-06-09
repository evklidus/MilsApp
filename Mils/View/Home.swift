//
//  Home.swift
//  Mils
//
//  Created by Erik Minasov on 17.01.2021.
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
                    .frame(width: allRecipesPresent ? width / 2.1 : nil)
                    .foregroundColor(.black)
                    .accentColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
                    //.textContentType(.username)
                    
                    Spacer()
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
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: width / 16))
                        .foregroundColor(Color.gray.opacity(0.75))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, width / 30)
                        .opacity(allRecipesPresent ? 1 : 0)
                        .onTapGesture {
                            search = ""
                        }
                )
                
                Spacer()
                
                if allRecipesPresent {
                    Button(action: {
                        search = ""
                        hideKeyboard()
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

struct Home: View {
    @ObservedObject var data : OurData
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var search = ""
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var allRecipesPresent = false
    
    @State var showSmallCategories = false
    
    @State var reader1 : CGFloat = 0
    
    var body: some View {
        
        if horizontalSizeClass == .compact {
            
            GeometryReader { geo in
                ScrollViewReader { scrollReader in
                
                ZStack(alignment: .top) {
                    
                    HomeHeader(data: data, width: geo.size.width, showSmallCategories: $showSmallCategories, search: self.$search, allRecipesPresent: self.$allRecipesPresent)
                        .zIndex(1)
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack {
                            if !allRecipesPresent && !homeVM.showAllRecipes {
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    HStack {
                                        ForEach(data.categories) { category in
                                            
                                            CategoryView(category: category, width: geo.size.width, image: true)
                                                .onTapGesture {
                                                    withAnimation {homeVM.choicedCategory = category}
                                                }
                                        }
                                    }
                                    .padding(.leading, 20)
                                }
                                .id("TOP")
                                .onChange(of: homeVM.choicedCategory) { _ in
                                    withAnimation {scrollReader.scrollTo("TOP", anchor: .top)}
                                }
                                
                                GeometryReader { reader in
                                    HStack {
                                        
                                        Text(homeVM.choicedCategory.name)
                                            .foregroundColor(homeVM.darkTheme ? .white : .black)
                                            .fontWeight(.heavy)
                                            .font(.system(size: geo.size.width / 20))
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, horizontalSizeClass == .compact ? 20 : 40)
                                    .onChange(of: reader.frame(in: .global).minY) { value in
                                        DispatchQueue.main.async {
                                            
                                            if value < geo.size.width / 2 {
                                                
                                                showSmallCategories = true
                                            }
                                            else {
                                                
                                                showSmallCategories = false
                                            }
                                        }
                                    }
                                }
                            }
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 2), alignment: .leading, spacing:  homeVM.darkTheme ? 25 : 15) {
                                ForEach(allRecipesPresent ? homeVM.allRecipes.filter{$0.name.contains(search)} : homeVM.showAllRecipes ? homeVM.allRecipes.filter{(homeVM.caloriesStart...homeVM.caloriesEnd).contains(Int($0.kcal)!) && homeVM.complexitysArr.contains($0.complexity)} :  homeVM.choicedCategory.recipes.filter{(homeVM.caloriesStart...homeVM.caloriesEnd).contains(Int($0.kcal)!) && homeVM.complexitysArr.contains($0.complexity)}) { recipe in
                                    
                                    ReceiptView(recipe: recipe, width: geo.size.width)
                                }
                            }
                            .padding(20)
                            
                            Spacer()
                                .frame(height: geo.size.width / 6)
                        }
                    }
                    .zIndex(0)
                    .padding(.top, geo.size.width / 6)
                }
                .ignoresSafeArea()
                .padding(.top)
                .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
                .animation(.default)
                }
            }
        }
        else {
            
            GeometryReader { geo2 in
                
                HStack {
                    
                    if !allRecipesPresent {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            HStack {
                                
                                VStack {
                                    
                                    ForEach(data.categories) { category in
                                        
                                        CategoryView(category: category, width: geo2.size.width)
                                            .onTapGesture {
                                                withAnimation {homeVM.choicedCategory = category}
                                            }
                                    }
                                }
                                .padding(.top, geo2.size.width / 20)
                                
                                Divider()
                            }
                        }
                        .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)).ignoresSafeArea() : Color.white.ignoresSafeArea())
                    }
                    
                    VStack {
                        
                        HStack {
                            
                            HStack {
                                
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
                                    .font(.system(size: geo2.size.width / 60))
                                
                                TextField("Поиск", text: $search, onEditingChanged: { _ in
                                    withAnimation {allRecipesPresent.toggle()}
                                })
                                .foregroundColor(.black)
                                .accentColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)).opacity(0.75))
                                //.textContentType(.username)
                            }
                            .padding([.vertical, .horizontal], 18)
                            .frame(height: geo2.size.width / 24)
                            .background(Color.white)
                            .cornerRadius(geo2.size.width / 90)
                            .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.15), radius: 10, x: 0, y: 5)
                            .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)))
                                    .font(.system(size: geo2.size.width / 54))
                                    .padding([.vertical, .horizontal], 18)
                                    .frame(width: geo2.size.width / 24, height: geo2.size.width / 24)
                                    .background(Color.white)
                                    .cornerRadius(geo2.size.width / 90)
                                    .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.15), radius: 10, x: 0, y: 5)
                                    .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
                            }
                        }
                        .padding([.horizontal, .vertical], geo2.size.width / 75)
                        
                        HStack {
                            
                            Text(homeVM.choicedCategory.name)
                                .foregroundColor(homeVM.darkTheme ? .white : .black)
                                .fontWeight(.heavy)
                                .font(.system(size: geo2.size.width / 30))
                            
                            Spacer()
                        }
                        .padding(.leading, horizontalSizeClass == .compact ? 20 : 40)
                        
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 50), count: 3), spacing: homeVM.darkTheme ? 50 : 25) {
                                ForEach(allRecipesPresent ? homeVM.allRecipes.filter({"\($0.name)".contains(search)}) : homeVM.choicedCategory.recipes) { recipe in
                                    
                                    ReceiptView(recipe: recipe, width: geo2.size.width)
                                }
                            }
                            .padding(.horizontal, geo2.size.width / 60)
                            .padding(.vertical, geo2.size.width / 80)
                            
                            Spacer()
                                .frame(height: geo2.size.width / 12)
                        }
                        .padding(.top, -3)
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                }
                .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
                .ignoresSafeArea()
                .onAppear {
                    
                    homeVM.choicedCategory = data.categories.first!
                    
                    DispatchQueue.main.async {
                        
                        for category in data.categories {
                            
                            homeVM.allRecipes.append(contentsOf: category.recipes)
                        }
                    }
                }
//                .animation(.easeInOut)
            }
        }
    }
}

//UIScreen.main.bounds.width > UIScreen.main.bounds.height ? 4 : 3
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home(data: OurData())
            .environmentObject(HomeViewModel())
            .preferredColorScheme(.light)
    }
}
