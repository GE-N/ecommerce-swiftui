//
//  ContentView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 3/11/2567 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct RecommendProductView: View {
    @State var showLoadmore: Bool = true

    private let layout: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 100), spacing: 16)
    ]
    var body: some View {
        VStack {
            Text("Recommend Product")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading, .trailing], 16)
            
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<10) { i in
                        NavigationLink {
                            ProductDetailsView()
                        } label: {
                            ProductItem(item: .init(title: "item \(i)"))
                                .padding(.bottom, 8)
                        }
                    }
                }
            }
            .scrollClipDisabled()
            .padding(.horizontal)
            
            if showLoadmore {
                ZStack {
                    ProgressView()
                        .controlSize(.large)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ContentView()
}
