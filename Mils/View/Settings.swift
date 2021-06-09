//
//  Settings.swift
//  Mils
//
//  Created by Erik Minasov on 28.01.2021.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var height = UIScreen.main.bounds.height
    
    @State private var isAdded = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollView {
                
                HStack {
                    
                    Text("Настройки")
                        .foregroundColor(homeVM.darkTheme ? .white : .black)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(showsIndicators: false) {
                    
                    SettingRow(name: "Темная тема", width: geo.size.width)
                    
                    Spacer()
                        .frame(height: geo.size.width / 6)
                }
                
                Spacer()
            }
            .background(homeVM.darkTheme ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
        }
    }
}

struct SettingRow : View {
    @EnvironmentObject var homeVM: HomeViewModel
    
    var name : String
    
    var width : CGFloat
    
    var body: some View {
        
        HStack {
            
            Text(name)
                .foregroundColor(homeVM.darkTheme ? .black : .white)
                .font(.system(size: width / 20, weight: .medium))
            
            Spacer()
            
            Toggle(isOn: withAnimation {$homeVM.darkTheme}) {Text("")}
                .toggleStyle(SwitchToggleStyle(tint: Color.orange))
                .labelsHidden()
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.gray)
        .cornerRadius(15)
        .padding(.horizontal, width / 20)
    }
}
//, design: .rounded
