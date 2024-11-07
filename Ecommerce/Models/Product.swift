//
//  Product.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 7/11/2567 BE.
//

import Foundation
import DeveloperToolsSupport

struct Product {
    let title: String
    let image: ImageResource
    
    init(title: String, image: ImageResource = .catfood1) {
        self.title = title
        self.image = image
    }
}
