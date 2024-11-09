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
    func fetchBanners(_ api: API) async {
        let apiResult: Result<BannerResult, Error> = await api.request(.banners)
        switch apiResult {
        case let .success(result):
            self.banners = result.banners
        case .failure(let error):
            // TODO: handle error if API load fail
            break
        }
    }

    @MainActor
    func fetchRecommendProducts(_ api: API) async {
        let apiResult: Result<ProductResult, Error> = await api.request(.recommendProducts)
        switch apiResult {
        case let .success(result):
            self.recommendProducts = result.products
        case .failure(let error):
            // TODO: handle error if API load fail
            break
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var api: API
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
            await viewModel.fetchBanners(api)
            await viewModel.fetchRecommendProducts(api)
        }
    }
}

#Preview {
    let api = API()
    
    HomeView()
        .environmentObject(api)
}
