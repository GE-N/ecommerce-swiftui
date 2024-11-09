//
//  API.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 9/11/2567 BE.
//

import Foundation

enum APIError: Error {
    case badUrl
}

class API: ObservableObject {
    enum Service {
        case banners
        case recommendProducts
        
        var path: String {
            // TODO: Seperate environment for different environment
            switch self {
            case .banners: return "/api/banner/banner.json"
            case .recommendProducts: return "/api/products/recommend.json"
            }
        }
    }
    
    let host: String = {
        // TODO: Seperate environment for different environment
        "http://localhost:8080"
    }()
    
    func request<T: Decodable>(_ service: Service) async -> Result<T, Error> {
        // NOTE: Handle any api request action which will need such as renew token if expired.
        guard let api = URL(string: "\(host)\(service.path)") else {
            return .failure(APIError.badUrl)
        }
        do {
            let (apiResult, _) = try await URLSession.shared.data(from: api)
            let result = try JSONDecoder().decode(T.self, from: apiResult)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
