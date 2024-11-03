//
//  ContentView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 3/11/2567 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                BannerView()
                    .frame(height: 250)
                    .ignoresSafeArea()
                Spacer()
            }
            VStack {
                SearchBarView()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
