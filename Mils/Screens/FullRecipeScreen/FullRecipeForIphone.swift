//
//  FullRecipeForIphone.swift
//  Mils
//
//  Created by Erik Minasov on 07.07.2021.
//

import SwiftUI

struct FullRecipeForIphone: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var isTapped = false
    
    @Binding var recipe: Recipe
    
    @State var secretImage: String
    
    @State var multiplier = 1 {
        
        didSet {
            
            if multiplier <= 0 {
                
                multiplier = 1
            }
        }
    }
    
    @State var scrolledStep = 1
    
    @State var textForFlyingButton = "Следующий шаг"
    
    //    @State var image = ""
    
    @State var revealDetails = false
    
    @State var discloseIngredients = false
    
    @State var viewSteps = false
    
    let width = UIScreen.main.bounds.width
    
//    @State var showXmark = true
    
    var body: some View {
        
        ZStack {
                
                VStack(spacing: 0) {
                    
                    VStack(spacing: 5) {
                        
                        HStack(spacing: width / 35) {
                            
                            Button(action: {withAnimation {homeVM.isPresent.toggle()}}
                            ) {
                                
                                Image(systemName: "xmark")
                                    .font(.system(size: width / 14, weight: .heavy))
                                    .foregroundColor(.orange)
                            }
                            
                            Text("Рецепт")
                                .font(.system(size: width / 14))
                                .fontWeight(.heavy)
                                .foregroundColor(homeVM.darkTheme ? .white : .black)
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: width, height: width / 10)
                        
                        Divider()
                    }
                    
                    ScrollView(showsIndicators: false) {
                        
                        ScrollViewReader { scrollReader in //
                            
                            VStack(spacing: 10) {
                                
                                AsyncImage(url: URL(string: recipe.image)) { phase in
                                    if let image = phase {
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                    }
                                    else {
                                        Image(systemName: "photo")
                                    }
                                } placeholder: {
                                    Rectangle()
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                                .frame(width: width, height: width / 1.5)
                                .overlay( // пасхалка для теста
                                    Image("SaskeSharingan")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        .offset(y: -200)
                                        .id("Top")
                                        .frame(maxHeight: .infinity, alignment: .top)
                                )
                                .onChange(of: homeVM.isPresent, perform: { value in
                                    if !value {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            scrollReader.scrollTo("Top", anchor: .top)
                                            //                                        self.image = ""
                                        }
                                    }
                                    //                                else {
                                    //                                    self.image = self.recipe.image
                                    //                                }
                                })
                                
                                HStack {
                                    
                                    Text(recipe.name)
                                        .foregroundColor(homeVM.darkTheme ? .white : .black)
                                        .font(.system(size: width / 14))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation {homeVM.saveRecipe(isTapped: &isTapped, recipe: recipe)}
                                    }) {
                                        
                                        Image(systemName: isTapped ? "heart.fill" : "heart")
                                            .foregroundColor(homeVM.darkTheme ? (isTapped ? .red : .white) : (isTapped ? .red : .black))
                                            .font(.system(size: width / 14))
                                            .padding(5)
                                            .background(homeVM.darkTheme ? Color.init(#colorLiteral(red: 0.1332783699, green: 0.1311504841, blue: 0.136387825, alpha: 1)) : Color.white)
                                            .cornerRadius(width / 32)
                                            .shadow(color: isTapped ? Color.red.opacity(homeVM.darkTheme ? 0 : 0.20) : Color.black.opacity(homeVM.darkTheme ? 0 : 0.20), radius: 7.5, x: 0, y: 5)
                                            .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 3, x: 0, y: 2)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                
                                HStack {
                                    
                                    RecipeInfoView(width: width, image: "⏱", text: "\(recipe.time) м", subText: "Время", bgColor: UIColor.init(Color.init(#colorLiteral(red: 0.9998165965, green: 0.8103166819, blue: 0.6789484024, alpha: 1))))
                                    Spacer(minLength: 0)
                                    RecipeInfoView(width: width, image: "👩🏻‍🍳", text: recipe.complexity, subText: "Сложность", bgColor: UIColor.init(Color.init(#colorLiteral(red: 0.6981404424, green: 0.724893868, blue: 1, alpha: 1))))
                                    Spacer(minLength: 0)
                                    RecipeInfoView(width: width, image: "🤑", text: recipe.cost, subText: "Цена", bgColor: UIColor.init(Color.init(#colorLiteral(red: 0.4602553248, green: 0.8694165349, blue: 0.7679057717, alpha: 1))))
                                }
                                .padding(.horizontal, width / 20)
                                .padding(.bottom, width / 35)
                                
                                HStack {
                                    
                                    Text("Энергетическая ценность")
                                        .foregroundColor(homeVM.darkTheme ? .white : .black)
                                        .fontWeight(.bold)
                                        .font(.system(size: width / 22))
                                    
                                    Spacer()
                                    
                                    Text("на 1 порцию")
                                        .foregroundColor(.gray)
                                        .font(.system(size: width / 25))
                                }
                                .padding(.horizontal)
                                
                                HStack {
                                    Spacer(minLength: 0)
                                    EnergyValueView(width: width, text: "ккал", value: recipe.kcal)
                                    Spacer(minLength: 0)
                                    EnergyValueView(width: width, text: "белки", value: recipe.proteins)
                                    Spacer(minLength: 0)
                                    EnergyValueView(width: width, text: "жиры", value: recipe.fats)
                                    Spacer(minLength: 0)
                                    EnergyValueView(width: width, text: "углеводы", value: recipe.carbohydrates)
                                    Spacer(minLength: 0)
                                }
                                
                                IngredientsView(width: width, pad: false)
                                
                                ScrollButton(width: width, pad: false)
                                    .onTapGesture {
                                        
    //                                    if homeVM.tapOnStep == "notTapped" {
    //
    //                                        withAnimation {homeVM.tapOnStep = recipe.steps.first ?? "notTapped"}
    //
    //                                        withAnimation {scrollReader.scrollTo(0, anchor: .center)} //, anchor: .center
    //                                    }
    //
    //                                    else {
    //
    //                                        withAnimation {homeVM.tapOnStep = "notTapped"}
    //                                        scrolledStep = 1
    //                                    }
    //                                    StepView(recipre: recipe)
                                        withAnimation {
                                            viewSteps = true
                                        }
                                    }
                                    .onAppear() {
                                        
                                        NotificationCenter.default.addObserver(forName: NSNotification.Name("next"), object: nil, queue: .main) { (_) in
                                            
                                            withAnimation {scrollReader.scrollTo(scrolledStep, anchor: scrolledStep == recipe.steps.count ? .center : .bottom)}
                                        }
                                    }
                                
                                VStack {
                                    
                                    ForEach(recipe.steps, id: \.self) { step in
                                        
                                        CardView(width: width, step: step,index: recipe.steps.firstIndex(of: step)!)
                                            .id(recipe.steps.firstIndex(of: step)!)
                                    }
                                }
                            }
                        }
                    }
                }
                .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
                .onAppear() {
                    
                    DispatchQueue.main.async {
                        
                        isTapped = UserDefaults.standard.bool(forKey: recipe.name)
                        
                        multiplier = UserDefaults.standard.integer(forKey: recipe.id + "multiplier")
                    }
                }
                .onChange(of: homeVM.isPresent, perform: { value in
                    DispatchQueue.main.async {
                        
                        isTapped = UserDefaults.standard.bool(forKey: recipe.name)
                        
                        if homeVM.isPresent {
                            multiplier = UserDefaults.standard.integer(forKey: "\(recipe.id)multiplier")
                        }
                        
    //                    withAnimation {homeVM.tapOnStep = "notTapped"}
    //                    showXmark = true
                    }
                })
                .onChange(of: multiplier) { value in
                    UserDefaults.standard.setValue(multiplier, forKey: "\(recipe.id)multiplier")
                }
                .zIndex(0)
    //            .safeAreaInset(edge: .bottom) {
    //
    //                HStack {
    //
    //                    HStack {
    //
    //                        Image(systemName: "xmark")
    //                            .font(.system(size: geo.size.width / 18, weight: .bold))
    //                            .foregroundColor(.red)
    //                            .onTapGesture {
    //
    //                                withAnimation {homeVM.tapOnStep = "notTapped"}
    //                                scrolledStep = 1
    //                                withAnimation {textForFlyingButton = "Следующий шаг"}
    //                                print(scrolledStep)
    //                            }
    //
    //                        Capsule()
    //                            .fill(Color.gray.opacity(0.15))
    //                            .frame(width: 2, height: geo.size.width / 18)
    //                    }
    //                    .opacity(showXmark ? 1 : 0)
    //                    .frame(width: showXmark ? nil : 0)
    //
    //                    Text(textForFlyingButton)
    //                        .font(.system(size: geo.size.width / 20))
    //                        .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.7037059665, blue: 0.1468696296, alpha: 1)))
    //                        .fontWeight(.heavy)
    //
    //                    Image(systemName: "arrowtriangle.trailing.fill")
    //                        .font(.system(size: geo.size.width / 32))
    //                        .foregroundColor(.white)
    //                }
    //                .padding(.vertical, geo.size.width / 35)
    //                .padding(.leading, showXmark ? geo.size.width / 35 : 0)
    //                .background(Rectangle().foregroundColor(.white))
    //                .cornerRadius(geo.size.width / 30)
    //                .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.3), radius: 20, x: 0, y: 10)
    //                .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.2), radius: 5, x: 0, y: 2)
    //                //                        .padding(.horizontal, geo.size.width / 4.75)
    //                //                        .frame(height: homeVM.tapOnStep == "notTapped" ? 0 : nil)
    //                .opacity(homeVM.tapOnStep == "notTapped" ? 0 : 1)
    //                .onTapGesture {
    //
    //                    if scrolledStep < (recipe.steps.count) {
    //                        withAnimation {homeVM.tapOnStep = recipe.steps[scrolledStep]}
    //                        NotificationCenter.default.post(name: NSNotification.Name("next"), object: nil)
    //                    }
    //                    else {
    //
    //                        if textForFlyingButton == "Закончить" {
    //
    //                            withAnimation {homeVM.tapOnStep = "notTapped"}
    //                            scrolledStep = 0
    //                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    //                                withAnimation {textForFlyingButton = "Следующий шаг"}
    //                                showXmark = true
    //                            }
    //                        }
    //                        else {
    //
    //                            withAnimation {homeVM.tapOnStep = "notTapped"}
    //                            scrolledStep = 0
    //                            withAnimation {textForFlyingButton = "Следующий шаг"}
    //                        }
    //                    }
    //
    //                    if (scrolledStep - (recipe.steps.count - 1)) == 0 {
    //
    //                        withAnimation {textForFlyingButton = "Закончить"}
    //
    //                        withAnimation {showXmark = false}
    //
    //                        // Добавить выполнение ачивки
    //                    }
    //                    scrolledStep += 1
    //                }
    //            }
            
            
            if viewSteps {
                StepsScreen(recipe: recipe, viewSteps: $viewSteps)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                    .zIndex(2)
            }
        }
    }
}
