//
//  HomeSearchBar.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 3/11/2567 BE.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack(spacing: 8) {
            // TODO: Dismiss keyboard
            searchTextField()

            Button {
                // TODO: Navigate to basket
            } label: {
                Image(systemName: "basket")
            }
            .foregroundStyle(Color.white)

            Button {
                // TODO: Navigate to chat
            } label: {
                Image(systemName: "message")
            }
            .foregroundStyle(Color.white)
        }
        .padding(.horizontal)
    }

    func searchTextField() -> some View {
        ZStack {
            Color.white
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Style.textColor)
                    .padding(.leading, 8)
                TextField("Search", text: .constant(""))
                Button {
                    // TODO: Open camera
                } label: {
                    Image(systemName: "camera")
                        .foregroundStyle(Style.textColor)
                        .padding(.trailing, 8)
                }
            }
        }
        .frame(height: 44)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
