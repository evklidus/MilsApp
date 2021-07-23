//
//  FullRecipeForIpad.swift
//  Mils
//
//  Created by Erik Minasov on 09.04.2021.
//

import SwiftUI

struct FullRecipeForIpad: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var isTapped = false
    
    @State var recipe: Recipe
    
    @State var multiplier = 1 {
        
        didSet {
            
            if multiplier <= 0 {
                
                multiplier = 1
            }
        }
    }
    
    @State var scrolledStep = 1
    
    @State var textForFlyingButton = "Следующий шаг"
    
    @State var image = ""
    
    @State var revealDetails = false
    
    @State var discloseIngredients = false
    
    @State var showXmark = true
    
    var body: some View {
        
        ScrollViewReader { scrollReader1 in
            
            GeometryReader { geo2 in
                
                HStack(spacing: 0) {
                    
                    VStack {
                        
                        HStack(spacing: 10) {
                            
                            Button(action: {withAnimation {homeVM.isPresent.toggle()}}
                            ) {
                                
                                Image(systemName: "xmark")
                                    .font(.system(size: geo2.size.width / 28, weight: .heavy))
                                    .foregroundColor(.orange)
                            }
                            
                            Text("Рецепт")
                                .font(.system(size: geo2.size.width / 28))
                                .fontWeight(.heavy)
                                .foregroundColor(homeVM.darkTheme ? .white : .black)
                            
                            Spacer()
                        }
                        .padding()
                        .padding()
                        
                        AsyncImage(url: URL(string: image)) { phase in
                            if let image = phase {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geo2.size.width / 3, height: geo2.size.width / 2.5)
                                    .clipped()
                                    .cornerRadius(geo2.size.width / 40)
                                    .animation(.spring())
                            }
                            else {
                                Image(systemName: "photo")
                                    .frame(width: geo2.size.width / 3, height: geo2.size.width / 2.5)
                            }
                        } placeholder: {
                            ProgressView()
                                .frame(width: geo2.size.width / 3, height: geo2.size.width / 2.5)
                        }
                        
                        
                        HStack {
                            
                            Text(recipe.name)
                                .foregroundColor(homeVM.darkTheme ? .white : .black)
                                .font(.system(size: geo2.size.width / 40))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation {homeVM.saveRecipe(isTapped: &isTapped, recipe: recipe)}
                            }) {
                                
                                Image(systemName: isTapped ? "heart.fill" : "heart")
                                    .foregroundColor(homeVM.darkTheme ? (isTapped ? .red : .white) : (isTapped ? .red : .black))
                                    .font(.system(size: geo2.size.width / 35))
                                    .padding(5)
                                    .background(Color.white)
                                    .cornerRadius(geo2.size.width / 81)
                                    .shadow(color: isTapped ? Color.red.opacity(homeVM.darkTheme ? 0 : 0.20) : Color.black.opacity(homeVM.darkTheme ? 0 : 0.20), radius: 7.5, x: 0, y: 5)
                                    .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 3, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal, geo2.size.width / 25)
                        .padding(.vertical, geo2.size.width / 150)
                        
                        Spacer(minLength: 0)
                        
                        HStack {
                            Spacer(minLength: 0)
                            EnergyValueView(width: geo2.size.width, text: "ккал", value: recipe.kcal)
                            Spacer(minLength: 0)
                            EnergyValueView(width: geo2.size.width, text: "белки", value: recipe.proteins)
                            Spacer(minLength: 0)
                            EnergyValueView(width: geo2.size.width, text: "жиры", value: recipe.fats)
                            Spacer(minLength: 0)
                            EnergyValueView(width: geo2.size.width, text: "углеводы", value: recipe.carbohydrates)
                            Spacer(minLength: 0)
                        }
                        .padding([.bottom, .horizontal], geo2.size.width / 35)
                        
                        Spacer(minLength: 0)
                    }
                    .frame(width: geo2.size.width / 2.5)
                    
                    VStack {
                        
                        ScrollViewReader { scrollReader in
                            
                            ScrollView(.vertical) {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation {discloseIngredients.toggle()}
                                    }) {
                                        
                                        Text("Ингредиенты")
                                            .font(.system(size: geo2.size.width / 65))
                                            .foregroundColor(.black)
                                            .fontWeight(.heavy)
                                            .padding(.vertical, geo2.size.width / 70)
                                            .padding(.horizontal)
                                            .background(Color.white)
                                            .cornerRadius(geo2.size.width / 60)
                                            .shadow(color:  Color.black.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 7.5, x: 0, y: 5)
                                            .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 3, x: 0, y: 2)
                                            .padding(.top, geo2.size.width / 50)
                                    }
                                    
                                    ScrollButton(width: geo2.size.width, pad: true)
                                        .onTapGesture {
                                            
                                            if homeVM.tapOnStep == "notTapped" {
                                                
                                                withAnimation {homeVM.tapOnStep = recipe.steps.first ?? "notTapped"}
                                                
                                                withAnimation {scrollReader.scrollTo(0)} //, anchor: .center
                                                
                                                withAnimation {image = recipe.images[scrolledStep - 1]}
                                            }
                                            
                                            else {
                                                
                                                withAnimation {homeVM.tapOnStep = "notTapped"}
                                                
                                                withAnimation {image = recipe.image}
                                            }
                                        }
                                        .onAppear() {
                                            
                                            NotificationCenter.default.addObserver(forName: NSNotification.Name("next"), object: nil, queue: .main) { (_) in
                                                
                                                withAnimation {scrollReader.scrollTo(scrolledStep)}
                                                
                                                withAnimation(.easeInOut) {image = withAnimation(.easeInOut) {recipe.images[scrolledStep - 1]}}
                                            }
                                        }
                                }
                                .padding(.horizontal)
                                .padding(.top)
                                
                                VStack(alignment: .leading) {
                                    
                                    ForEach(recipe.steps, id: \.self) { step in
                                        
                                        StepView(width: geo2.size.width, step: step)
                                            .id(recipe.steps.firstIndex(of: step)!)
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .overlay(
                        
                        HStack(spacing: geo2.size.width / 80) {
                        
                        if (scrolledStep - recipe.steps.count) != 0 {
                            
                            Image(systemName: "xmark")
                                .font(.system(size: geo2.size.width / 45, weight: .bold))
                                .foregroundColor(.red)
                                .onTapGesture {
                                    
                                    withAnimation {homeVM.tapOnStep = "notTapped"}
                                    scrolledStep = 0
                                    withAnimation {textForFlyingButton = "Следующий шаг"}
                                }
                            
                            
                            Capsule()
                                .fill(Color.gray.opacity(0.15))
                                .frame(width: 2, height: geo2.size.width / 36)
                        }
                        
                        Text(textForFlyingButton)
                            .font(.system(size: geo2.size.width / 45))
                            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.7037059665, blue: 0.1468696296, alpha: 1)))
                            .fontWeight(.heavy)
                        
                        Image(systemName: "arrowtriangle.trailing.fill")
                            .font(.system(size: geo2.size.width / 32))
                            .foregroundColor(.white)
                    }
                            .padding([.vertical, .leading], geo2.size.width / 80)
                            .background(Color.white)
                            .cornerRadius(geo2.size.width / 75)
                            .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.3), radius: 20, x: 0, y: 10)
                            .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
                            .padding(.horizontal, geo2.size.width / 7.25)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .opacity(homeVM.tapOnStep == "notTapped" ? 0 : 1)
                            .padding(.bottom, geo2.size.width / 40)
                            .onTapGesture {
                        DispatchQueue.main.async {
                            scrolledStep += 1
                            if scrolledStep <= recipe.steps.count {
                                withAnimation {homeVM.tapOnStep = recipe.steps[scrolledStep - 1]}
                                NotificationCenter.default.post(name: NSNotification.Name("next"), object: nil)
                            }
                            else {
                                withAnimation {homeVM.tapOnStep = "notTapped"}
                                
                                scrolledStep = 1
                                
                                withAnimation {textForFlyingButton = "Следующий шаг"}
                                
                                withAnimation {image = recipe.image}
                                
                            }
                            
                            if (scrolledStep - recipe.steps.count) == 0 {
                                
                                withAnimation {textForFlyingButton = "Закончить"}
                            }
                        }
                    }
                        
                        
                    )
                }
                .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
                .ignoresSafeArea()
                .overlay(
                    VStack {
                    IngredientsView(width: UIScreen.main.bounds.width, pad: true)
                        .frame(width: geo2.size.width, height: geo2.size.height)
                        .background(
                            Color.black.ignoresSafeArea().opacity(discloseIngredients ? 0.3 : 0)
                                .onTapGesture {
                            
                            withAnimation {discloseIngredients.toggle()}
                        }
                        )
                        .opacity(discloseIngredients ? 1 : 0)
                }
                )
                .onAppear() {
                    DispatchQueue.main.async {
                        
                        isTapped = UserDefaults.standard.bool(forKey: recipe.name)
                        
                        multiplier = UserDefaults.standard.integer(forKey: recipe.id + "multiplier")
                        
                        withAnimation {image = recipe.image}
                    }
                }
                .onChange(of: homeVM.isPresent, perform: { value in
                    
                    DispatchQueue.main.async {
                        
                        isTapped = UserDefaults.standard.bool(forKey: recipe.name)
                        
                        if homeVM.isPresent {
                            multiplier = UserDefaults.standard.integer(forKey: "\(recipe.id)multiplier")
                        }
                        
                        withAnimation {homeVM.tapOnStep = "notTapped"}
                        
                        withAnimation {image = recipe.image}
                        
                        scrolledStep = 1
                    }
                })
                .onChange(of: multiplier) { value in
                    UserDefaults.standard.setValue(multiplier, forKey: "\(recipe.id)multiplier")
                }
            }
        }
    }
}
