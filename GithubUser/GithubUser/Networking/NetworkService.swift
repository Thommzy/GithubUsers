//
//  NetworkService.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Codable>(
        endpoint: Endpoint,
        completion: @escaping (Result<T, Error>) -> ()
    )
}

class NetworkService: NetworkServiceProtocol {
    /// Request Executes the web call and will decode the JSON response into the codable object provided
    /// - Parameters:
    ///   - endpoint: the endpoint to make the HTTP request against
    ///   - completion: the JSON response converted to the provided Codable Object, if successful or failure otherwise
    func request<T: Codable>(
        endpoint: Endpoint,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.path = endpoint.path
        components.host = endpoint.baseURL
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard response != nil, let data = data else { return }
            
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])
                    print(error.localizedDescription, "Error: ")
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
