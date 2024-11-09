//
//  HomeView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 8/11/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var banners: [Banner] = []
    @Published var recommendProducts: [Product] = []

    @MainActor
    func fetchBanners() async {
        do {
            let getBannersUrl = URL(string: "http://localhost:8080/api/banner/banner.json")!
            let (apiResult, _) = try await URLSession.shared.data(from: getBannersUrl)
            let result = try JSONDecoder().decode(BannerResult.self, from: apiResult)
            self.banners = result.banners
        } catch {
            print("fetch banner error: \(error.localizedDescription)")
        }
    }

    @MainActor
    func fetchRecommendProducts() async {
        do {
            let getRecommendProductsUrl = URL(string: "http://localhost:8080/api/products/recommend.json")!
            let (apiResult, _) = try await URLSession.shared.data(from: getRecommendProductsUrl)
            let result = try JSONDecoder().decode(ProductResult.self, from: apiResult)
            self.recommendProducts = result.products
        } catch {
            print("fetch recommend items error: \(error)")
        }
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
                    if !viewModel.recommendProducts.isEmpty {
                        RecommendProductView(products: viewModel.recommendProducts)
                    }
                }
            }
            .ignoresSafeArea(.all)

            VStack {
                SearchBarView()
                Spacer()
            }
        }
        .task {
            await viewModel.fetchBanners()
            await viewModel.fetchRecommendProducts()
        }
    }
}

#Preview {
    HomeView()
}
