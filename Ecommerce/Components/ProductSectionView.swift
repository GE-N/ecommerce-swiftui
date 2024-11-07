//
//  ProductSectionView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 7/11/2567 BE.
//

import SwiftUI

struct ProductSection: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Product Section")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.yellow)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(
                    rows: [GridItem(.fixed(215))],
                    spacing: 16
                ) {
                    ForEach(1..<10) { i in
                        ProductItem(item: .init(title: "Product \(i)"))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ProductItem: View {
    let item: Product
    var body: some View {
        Button {
            // TODO: Navigate to product details
        } label: {
            VStack {
                // TODO: Show product image
                Image(systemName: "arcade.stick.console.fill")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .aspectRatio(0.5, contentMode: .fit)
                    .padding(.vertical, 8)
                
                Text(item.title)
                    .lineLimit(2)
            }
            .frame(width: 100)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: .gray.opacity(0.2), radius: 8)
        }
    }
}
