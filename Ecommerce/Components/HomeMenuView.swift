//
//  HomeMenuView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 6/11/2567 BE.
//

import SwiftUI

struct HomeMenuView: View {
    private let layout: [GridItem] = [GridItem(.fixed(125), spacing: 16), GridItem(.fixed(125))]
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(
                    rows: layout,
                    spacing: 16
                ) {
                    ForEach(0..<20, id: \.self) { i in
                        HomeMenuViewItem(menu: .init(title: "Item \(i)"))
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(height: 300)
    }
}


struct HomeMenuViewItem: View {
    let menu: HomeMenu
    var body: some View {
        ZStack {
            Color.white
            Button {
                // TODO: Navigate to menu
            } label: {
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Text("Star Star Star")
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
        .frame(width: 100)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .gray.opacity(0.2), radius: 8)
    }
}

struct HomeMenu {
    let title: String
}
