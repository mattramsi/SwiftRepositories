//
//  APIRepository.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL Inválida"
        default:
            return ""
        }
    }
}

class RepositoryAPI {
    
    static let shared = RepositoryAPI()
    
    let basePath = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    
    private static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 30
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
    }()
    
    var session = URLSession(configuration: configuration)
    
    func loadRepositories(onComplete: @escaping (Result<ListRepository, APIError>) -> Void) {

        guard let url = URL(string: basePath) else {
            return onComplete(.failure(.badURL))
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                
                let listRepository = try JSONDecoder().decode(ListRepository.self, from: data)
                return onComplete(.success(listRepository))
                
            } catch {
                return onComplete(.failure(.invalidJSON))
            }
        }
        
        task.resume()
    }
    
}

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
