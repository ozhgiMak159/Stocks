//
//  APICaller.swift
//  Stocks
//
//  Created by Maksim  on 02.02.2024.
//

import Foundation

enum Endpoint: String {
    case search
}

enum APIError: Error {
    case noDataReturned
    case invalidUrl
}

enum Constants: String {
    case apiKey = "0"
    case sandboxApiKey = "1"
    case baseUrl = "2"
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}

    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        return nil
    }
    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlString = url else {
            completion(.failure(APIError.invalidUrl))
            return }
        let task = URLSession.shared
        
        task.dataTask(with: urlString) { data, _, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
