//
//  HomeView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 8/11/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var banners: [Banner] = []

    @MainActor
    func fetchBanners() async throws {
        let getBannersUrl = URL(string: "http://localhost:8080/api/banner/banner.json")!
        let (apiResult, _) = try await URLSession.shared.data(from: getBannersUrl)
        let result = try JSONDecoder().decode(BannerResult.self, from: apiResult)
        self.banners = result.banners
    }
}

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    if !viewModel.banners.isEmpty {
                        BannerView(banners: viewModel.banners)
                            .frame(height: 280)
                    }
                    HomeMenuView()
                    ProductSection()
                    Color.gray.opacity(0.1)
                        .frame(height: 24)
                    ProductSection()
                    Color.gray.opacity(0.1)
                        .frame(height: 24)
                    RecommendProductView()
                }
            }
            .ignoresSafeArea(.all)

            VStack {
                SearchBarView()
                Spacer()
            }
        }
        .task {
            do {
                try await viewModel.fetchBanners()
            } catch {
                print("fetch banner error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView()
}
