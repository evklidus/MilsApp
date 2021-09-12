//
//  StepsScreen.swift
//  StepsScreen
//
//  Created by Erik Minasov on 05.09.2021.
//

import SwiftUI

struct StepsScreen: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var recipe : Recipe
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @Binding var viewSteps : Bool
    @State var selectedTab : Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(recipe.steps, id: \.self) { step in
                VStack {
                    AsyncImage(url: URL(string: recipe.images[recipe.steps.firstIndex(of: step)!])) { phase in
                        if let image = phase {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            //                                .clipShape(RoundedCorner(radius: width / 10, corners: [.bottomLeft, .bottomRight]))
                            
                        }
                        else {
                            Image(systemName: "photo")
                        }
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.5))
                    }
                    .frame(width: width / 1.05, height: width / 1.5)
                    .cornerRadius(width / 10)
                    //                    .padding(.top, width / 50)
                    
                    Text(step)
                        .font(Font.custom("IBMPlexSerif-Bold", size: 24))
                        .minimumScaleFactor(0.0000005)
                        .padding()
                    
                    Spacer(minLength: width / CGFloat(recipe.steps.count + 1))
                    
                    Spacer(minLength: 0)
                    
                    //                    HStack {
                    //                        ForEach(0..<recipe.steps.count) { index in
                    //                            BottomButton(currentStep: $selectedTab, text: "\(index + 1)", count: recipe.steps.count)
                    //                                .onTapGesture {
                    //                                    selectedTab = index
                    //                                }
                    //                        }
                    //                    }
                    //                    .padding(10)
                    
                    //                    Spacer(minLength: 0)
                    
                }
                .frame(width: width)
                .tag(recipe.steps.firstIndex(of: step)!)
                //                .tabItem {
                //                  Label("\(recipe.steps.firstIndex(of: step)!)", systemImage: "1.square.fill")
                //                }
            }
        }
        .tabViewStyle(.page)
        //        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(Color.white)
//        .statusBar(hidden: true)
        //        .ignoresSafeArea()
        .animation(.easeInOut)
        .overlay(
            VStack {
                Spacer()
                HStack {
                    ForEach(0..<recipe.steps.count) { index in
                        BottomButton(currentStep: $selectedTab, text: "\(index + 1)", count: recipe.steps.count)
                            .onTapGesture {
                                //                                print("index", index)
                                //                                print(selectedTab)
                                selectedTab = index
                                //                                print(selectedTab)
                            }
                    }
                }
            }
        )
        .overlay(
            VStack {
                HStack {
                    //                HStack {
                    //                    TopButton(image: "xmark")
                    //                        .onTapGesture {
                    //                            withAnimation {
                    //                                viewSteps = false
                    //                            }
                    //                        }
                    //                    Spacer()
                    //                    if selectedTab != (recipe.steps.endIndex - 1) {
                    //                        TopButton(image: "chevron.forward")
                    //                            .onTapGesture {
                    //                                selectedTab += 1
                    //                                print(selectedTab)
                    //                            }
                    //                    }
                    //                }
                    //                .padding()
                    
                    HStack(spacing: 12) {
                        TopButton(image: "xmark")
                            .onTapGesture {
                                withAnimation {
                                    viewSteps = false
                                }
                            }
                        
                        if selectedTab != (recipe.steps.endIndex - 1) {
                            Capsule()
                                .fill(Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)))
                                .frame(width: 3, height: 20)
                            
                            TopButton(image: "chevron.forward")
                                .onTapGesture {
                                    selectedTab += 1
                                    print(selectedTab)
                                }
                        }
                    }
                    .padding(6)
                    .padding(.horizontal, 3)
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.top)
                    
                    Spacer()
                }
                //                .padding(.top, width / 30)
                .padding(.leading, 18)
                .animation(.easeInOut)
                
                Spacer()
            }
        )
    }
}

struct BottomButton: View {
    @Binding var currentStep : Int
    let width = UIScreen.main.bounds.width
    let text : String
    let count : Int
    var countForSize : CGFloat {
        get {
            return CGFloat(Int(exactly: count)! + 1)
        }
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15).stroke().fill(currentStep == Int(text)! - 1 ? .orange : Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)))
            Text(text)
                .font(.system(size: 24))
                .bold()
                .foregroundColor(currentStep == Int(text)! - 1 ? .orange : Color.init(#colorLiteral(red: 0.8861458898, green: 0.8808785081, blue: 0.8901951313, alpha: 1)))
                .padding(.leading, 8)
                .padding(.top, 5)
        }
        .frame(width: width / countForSize, height: width / countForSize)
        .background(.white.opacity(0.0000001))
    }
}

struct TopButton: View {
    let width = UIScreen.main.bounds.width
    let image : String
    var homeVM = HomeViewModel()
    var body: some View {
        Image(systemName: image)
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.orange.opacity(0.85))
        //            .padding(.all, width / 25)
            .background(
                Color.white.opacity(0.0000001)
                //                    .clipShape(Rectangle())
                //                    .aspectRatio(1.0, contentMode: .fit)
                //                    .cornerRadius(15)
                //                    .shadow(color: Color.black.opacity(homeVM.darkTheme ? 0 : 0.4), radius: 3, x: 0, y: 2)
                //                    .shadow(color: Color.white.opacity(homeVM.darkTheme ? 0 : 0.15), radius: 1, x: 0, y: 1)
            )
    }
}
