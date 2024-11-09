//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 3/11/2567 BE.
//

import SwiftUI

@main
struct EcommerceApp: App {
    let api = API()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(api)
    }
}
