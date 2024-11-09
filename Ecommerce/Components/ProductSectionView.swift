//
//  ProductSectionView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 7/11/2567 BE.
//

import SwiftUI
import Kingfisher

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
                                    item: .init(title: "Product \(i) - Lorem ipsum Dolor"),
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
            if let url = item.imageUrl,
               let imageUrl = URL(string: url) {
                KFImage(imageUrl)
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fit)
            } else {
                Image(.catfood2)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }

            Text("\(item.name)")
                .lineLimit(2)
                .padding([.leading, .trailing, .bottom], 8)
        }
        .setWidth(width)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .gray.opacity(0.2), radius: 8)
    }
}

#Preview {
    let product = Product(
        title: "Purina ONE Tender Selects Blend with Real Salmon",
        imageURL: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRsesZXzdzeFmzjrlrPOW3-WxCkNtrJ6hEgdjsDg79FW4V7TZQ0cP9jLcgahdUHosVH3-M-R80z6Z_H0FKSYKEa3QVJS6QUsXkIrtq--_qj47gogggreMcvS3EatN2DoJxuDkTkUhld1Uhx&usqp=CAc")
    ProductItem(item: product)
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
