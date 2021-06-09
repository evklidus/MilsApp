//
//  MilsApp.swift
//  Mils
//
//  Created by Erik Minasov on 08.04.2021.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

private var cancellableSet: Set<AnyCancellable> = []

extension Published where Value: Codable {
    init(wrappedValue defaultValue: Value, key: String) {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let value = try JSONDecoder().decode(Value.self, from: data)
                self.init(initialValue: value)
            } catch {
                print("Error while deconding yser data")
                self.init(initialValue: defaultValue)
            }
        } else {
            self.init(initialValue: defaultValue)
        }
        
        projectedValue
            .sink { val in
                do {
                    let data = try JSONEncoder().encode(val)
                    UserDefaults.standard.set(data, forKey: key)
                } catch {
                    print("Error while decoding user data")
                }
            }
            .store(in: &cancellableSet)
    }
}

 @main
struct MilsApp: App {
    var data = OurData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
                .environmentObject(HomeViewModel())
//                .preferredColorScheme(.light)
        }
    }
}
