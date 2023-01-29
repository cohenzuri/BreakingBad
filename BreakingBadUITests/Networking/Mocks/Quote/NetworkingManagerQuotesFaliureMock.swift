//
//  NetworkingManagerQuotesFaliureMock.swift
//  BreakingBadUITests
//
//  Created by zuri cohen on 1/29/23.
//

import Foundation
import BreakingBad

class NetworkingManagerQuotesFaliureMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
}
