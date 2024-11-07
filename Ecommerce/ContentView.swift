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
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    BannerView()
                        .frame(height: 250)
                    HomeMenuView()
                    ProductSection()
                    Color.gray.opacity(0.1)
                        .frame(height: 24)
                    ProductSection()
                    Spacer()
                }
            }
            .ignoresSafeArea(.all)

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
