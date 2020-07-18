//
//  ApiService.swift
//  Movies
//
//  Created by Riki on 6/18/20.
//  Copyright © 2020 SanMyaNwe. All rights reserved.
//

import Foundation

class ApiService {
    
    static let shared = ApiService()
    private init() {}
    
    func fetchData<T>(
            endpoint: EndPoint,
            value: T.Type,
            com: @escaping (Result<T, ApiServiceError>)->Void
        ) where T: Codable {
            
            let params = ["api_key": Api.API_KEY]
            var urlComponent = URLComponents(string: endpoint.path)
            var queryItems = [URLQueryItem]()
            for param in params {
                queryItems.append(URLQueryItem(name: param.key, value: param.value))
            }
            urlComponent?.queryItems = queryItems
            guard let url = urlComponent?.url else { return }
            
            let requestUrl = URLRequest(url: url)
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: requestUrl) { (data, response, error) in
                
                if let _ = error { com(.failure(.unknown)) }
                
                let urlResponse = response as! HTTPURLResponse
                
                let statusCode = urlResponse.statusCode
                
                if 200...299 ~= statusCode {
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    guard let data = data else { return }
                    
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        com(.success(result))
                    } catch {
                        com(.failure(.decodingFail))
                    }
                } else if 300...500 ~= statusCode {
                    com(.failure(.clientError))
                } else {
                    com(.failure(.serverDown))
                }
                
            }
            
            task.resume()   
        }
    
}
