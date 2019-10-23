//
//  NetworkLayer.swift
//  NetworkSDK
//
//  Created by Macbook Pro on 10/18/19.
//  Copyright © 2019 Macbook Pro. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]?
typealias Headers = [String: String]?
typealias ErrorMessage = String

class Networking {
    static let shared = Networking()
    private init() {}

    func post(with path: String, parameters: Parameters, headers: Headers,
              completion: @escaping (Result) -> Void) {
        let url = URL(string: Constants.baseURL.rawValue + path)!
        var request = URLRequest(url: url)
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters as Any, options: JSONSerialization.WritingOptions())

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(error: ErrorModel(message: error.localizedDescription) ))
                return
            }
            guard let data = data else {
                let error = ErrorModel(message: Constants.defaultErrorMessage.rawValue)
                completion(.failure(error: error))
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                completion(.success)
            } else {
                let errorModel = try? JSONDecoder().decode(ErrorModel.self,
                                                           from: data)
                let error = ErrorModel(message: errorModel?.errorMessage ??
                                        Constants.defaultErrorMessage.rawValue)
                completion(.failure(error: error))
            }
        }

        task.resume()
    }
}
