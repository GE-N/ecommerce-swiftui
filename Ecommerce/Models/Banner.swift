//
//  Banner.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 8/11/24.
//

import Foundation

struct Banner: Codable {
    let id: Int
    let imageUrl: String?
    let backgroundColor: String?
}

struct BannerResult: Codable {
    let banners: [Banner]
}
