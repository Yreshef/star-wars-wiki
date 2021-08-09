//
//  NetworkService.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 31/07/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import Foundation
import Combine

// MARK: - Protocol

protocol NetworkServicing {
    func request<T>(type: T.Type, route: NetworkRoutes) -> AnyPublisher<T,NetworkError> where T:Decodable
}

enum NetworkResult<T: Decodable>{
    case success(result: T)
    case failure(error: Error)
}

enum NetworkError: LocalizedError {
    case noData
    case requestFailure(status: Int)
    case decodingFailure(error: Error)
    case invalidURL
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "Request successful, no data"
        case .decodingFailure(let error):
            return "Failed to decode JSON. \(error.localizedDescription)"
        case .requestFailure(let status):
            return "Request failed with status code: \(status)"
        case .invalidURL:
            return "Invalid url"
        case .invalidResponse:
            return "Invalid network response"
        }
        
    }
}

// MARK: - NetworkService

class NetworkService: NetworkServicing {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, route: NetworkRoutes)
    -> AnyPublisher<T,NetworkError> where T: Decodable{
        guard let url = URL(string: route.urlPath) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        return session
            .dataTaskPublisher(for: url)
            .tryMap { response -> Data in
                guard let res = response.response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                guard 200...299 ~= res.statusCode else {
                    throw NetworkError.requestFailure(status: res.statusCode)
                }
                return response.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.decodingFailure(error: error)
            }
            .eraseToAnyPublisher()
    }
    
}
