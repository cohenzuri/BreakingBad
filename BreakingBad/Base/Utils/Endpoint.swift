//
//  Endpoint.swift
//  BreakingBad
//
//  Created by zuri cohen on 1/23/23.
//

import Foundation

enum Endpoint {
    case quotes(amount: Int)
}

extension Endpoint {
    
    var host: String { "api.breakingbadquotes.xyz" }
    
    var path: String {
        
        switch self {
            
        case .quotes(amount: let amount):
            return "/v1/quotes/\(amount)"
        }
    }
    
    var methodType: MethodType {
        
        switch self {
            
        case .quotes:
            return .GET
            
        }
    }
    
    var queryItems: [String: String]? {
        switch self {
        case .quotes(amount: let amount):
            return nil
        default:
            return nil
        }
    }
}

extension Endpoint {
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        var requestQueryItems = [URLQueryItem]()
        
        queryItems?.forEach { item in
            requestQueryItems.append(URLQueryItem(name: item.key, value: item.value))
        }
        
        urlComponents.queryItems = requestQueryItems
        return urlComponents.url
    }
}

extension Endpoint  {
    
    enum MethodType: Equatable {
        case GET
        case POST(data: Data?)
    }
}
