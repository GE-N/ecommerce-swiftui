//
//  RecommendProductSectionView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 9/11/2567 BE.
//

import SwiftUI

struct RecommendProductView: View {
    let products: [Product]
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
                    ForEach(products) { product in
                        NavigationLink {
                            ProductDetailsView()
                        } label: {
                            ProductItem(item: .init(
                                title: product.name,
                                imageURL: product.imageUrl)
                            )
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
    let products: [Product] = [
        Product(
            title: "Purina ONE Tender Selects Blend with Real Salmon",
            imageURL: "https://www.purina.com/_gatsby/image/3a1bbc679d538f55a6062d4789776c00/7d5f95e0435891d1ac6df0357659d982/purina-one-tender-selects-chicken.avif?u=https%3A%2F%2Fwww.purina.com%2Fsites%2Fdefault%2Ffiles%2Fproducts%2Fpurina-one-tender-selects-chicken.png&a=w%3D800%26h%3D1000%26fm%3Davif%26q%3D75&cd=96cbcc186877a61705287273962f8bff"
        ),
        Product(
            title: "Hill's Science Diet Adult Indoor Cat Food",
            imageURL: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRsesZXzdzeFmzjrlrPOW3-WxCkNtrJ6hEgdjsDg79FW4V7TZQ0cP9jLcgahdUHosVH3-M-R80z6Z_H0FKSYKEa3QVJS6QUsXkIrtq--_qj47gogggreMcvS3EatN2DoJxuDkTkUhld1Uhx&usqp=CAc"
        )
    ]
    RecommendProductView(products: products)
}
