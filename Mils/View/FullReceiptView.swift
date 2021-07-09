//
//  FullReceiptView.swift
//  Mils
//
//  Created by Erik Minasov on 23.01.2021.
//

import SwiftUI

struct FullReceiptView: View {
    
    @Binding var recipe: Recipe
    
    var secretImage : String = "https://lh3.googleusercontent.com/proxy/M11nJ6xjdLVE3IuBQ0_hg7S7-NA-rhIQn4qDbNqXWBJevubmnsjasXjsEsrw6nbgyiiuALAbo8uWFsFxaex_rskbZ66376E-YlDvEuHb5B5u0WfhrtsGJuvIPSm0598pxbUyKunr_4qUNBQ"
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if horizontalSizeClass == .compact {
                
            FullRecipeForIphone(recipe: $recipe, secretImage: secretImage)
        }
        else {
            
            FullRecipeForIpad(recipe: recipe)
        }
    }
}

