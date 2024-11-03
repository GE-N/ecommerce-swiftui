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
                SearchBarView()
                Spacer()
            }
        }
    }
}

struct SearchBarView: View {
    var body: some View {
        HStack(spacing: 8) {
            searchTextField()

            Button {
                // TODO: Navigate to basket
            } label: {
                Image(systemName: "basket")
            }
            .foregroundStyle(Style.textColor)

            Button {
                // TODO: Navigate to chat
            } label: {
                Image(systemName: "message")
            }
            .foregroundStyle(Style.textColor)
        }
        .padding(.horizontal)
    }

    func searchTextField() -> some View {
        ZStack {
            Color.black.opacity(0.1)
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

#Preview {
    ContentView()
}
