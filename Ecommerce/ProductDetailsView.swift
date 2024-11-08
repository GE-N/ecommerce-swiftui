//
//  ProductDetailsView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 7/11/2567 BE.
//

import SwiftUI

struct ProductDetailsView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ProductDetailBarView()
                ScrollView {
                    ProductImageView(width: proxy.size.width)
                    ProductInfoView()
                }
                ProductDetailBottomBarView()
            }
        }
        .toolbar(.hidden)
    }
}

struct ProductDetailBarView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .tint(Color.black)
                }
                .padding(.horizontal, 8)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Style.textColor)
                        .padding(.leading, 8)
                        .padding(.vertical, 8)
                    
                    TextField("Search", text: .constant(""))
                }
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Button {
                    // TODO: Navigate to basket
                } label: {
                    Image(systemName: "cart")
                }
                .foregroundStyle(Color.black)
                
                Button {
                    // TODO: Navigate to basket
                } label: {
                    Image(systemName: "ellipsis")
                }
                .foregroundStyle(Color.black)
            }
            .padding()
        }
    }
}

struct ProductImageView: View {
    var width: CGFloat
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                Image(.catfood2)
                    .resizable()
                    .frame(width: width, height: width)
                
                Image(.catfood1)
                    .resizable()
                    .frame(width: width, height: width)
            }
        }
        .scrollTargetBehavior(.paging)
    }
}

struct ProductInfoView: View {
    var body: some View {
        VStack {
            Text("$19.99")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            Text("Whiskers Delight")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .padding(.bottom)
            
            Text("Whiskers Delight is a premium cat food formulated to provide your feline friend with complete and balanced nutrition. Packed with high-quality protein, essential vitamins, and minerals, this delicious recipe supports your cat's overall health and vitality. From fluffy fur to sparkling eyes, Whiskers Delight is the purrfect choice for your furry companion.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
        }
        .padding(.horizontal)
    }
}

struct ProductDetailBottomBarView: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Button {
                    // TODO: Go to shop page
                } label: {
                    Image(systemName: "storefront")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .tint(.black)
                }
                Text("Shop")
            }
            .padding(.top, 16)
            
            Spacer()
            
            VStack {
                Button {
                    // TODO: Go to shop page
                } label: {
                    Image(systemName: "ellipsis.bubble")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .tint(.black)
                }
                Text("chat")
            }
            .padding(.top, 16)
            
            Spacer()
            
            Button {
                // TODO: Add to cart
            } label: {
                Text("Add to cart")
                    .foregroundStyle(.red)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color.red)
                    }
            }
            
            Spacer()
            
            Button {
                // TODO: Go to buy now
            } label: {
                Text("Buy now")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(.horizontal)
        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.2), radius: 8)
    }
}

#Preview {
    ProductDetailsView()
}
