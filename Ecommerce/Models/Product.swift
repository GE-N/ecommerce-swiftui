//
//  Product.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 7/11/2567 BE.
//

import Foundation
import DeveloperToolsSupport

struct Product: Codable {
    let name: String
    let imageUrl: String?

    init(title: String, imageURL: String? = nil) {
        self.name = title
        self.imageUrl = imageURL
    }
}

extension Product: Identifiable {
    var id: String { name }
}

struct ProductResult: Codable {
    let products: [Product]
}
