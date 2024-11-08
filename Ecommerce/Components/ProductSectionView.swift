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
                        NavigationLink {
                            ProductDetailsView()
                        } label: {
                            if i.isMultiple(of: 2) {
                                ProductItem(
                                    item: .init(title: "Product \(i) - Lorem ipsum Dolor"),
                                    width: 100
                                )
                            } else {
                                ProductItem(
                                    item: .init(title: "Product \(i) - Lorem ipsum Dolor", image: .catfood2),
                                    width: 100
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 205)
        }
    }
}

struct ProductItem: View {
    let item: Product
    var width: CGFloat?

    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            
            Text("\(item.title)")
                .lineLimit(2)
                .padding([.leading, .trailing, .bottom], 8)
        }
        .setWidth(width)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .gray.opacity(0.2), radius: 8)
    }
}

// MARK: -

private extension View {
    /// To perform set content's width with optional value to avoid issue `invalid frame dimension (negative or non-finite)` issue on runtime.
    func setWidth(_ width: CGFloat?) -> some View {
        modifier(OptionalWidth(width: width))
    }
}

private struct OptionalWidth: ViewModifier {
    var width: CGFloat?
    func body(content: Content) -> some View {
        if let width = self.width, width >= 0 {
            content.frame(width: width)
        } else {
            content
        }
    }
}
