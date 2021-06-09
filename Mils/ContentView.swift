//
//  ContentView.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data : OurData
    var body: some View {
        TabBar(data: data)
    }
}
