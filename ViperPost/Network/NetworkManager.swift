//
//  NetworkManager.swift
//  ViperPost
//
//  Created by Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation

enum Resource {
    case post
}

enum NetworkResult<T>: Error {
    case success(T)
    case failure(Error)
}

protocol URLSessionProtocol {
    func request<T>(url:URL,resource: Resource,completionHandler: @escaping (NetworkResult<T>) -> Void)
}

class NetworkManager {
    let session:URLSessionProtocol
    
    init(session: URLSessionProtocol) { self.session = session }

    func getPost(url:URL,completionHandler:  @escaping (NetworkResult<Posts>) -> Void) {
        self.session.request(url: url, resource: Resource.post, completionHandler: completionHandler)
    }
}

extension URLSession: URLSessionProtocol {
    func request<T>(url: URL,resource: Resource, completionHandler: @escaping (NetworkResult<T>) -> Void)  {
        let task = self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(NetworkResult.failure(error))
            }
            else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    switch resource {
                    case .post:
                        guard let decode = try JSONDecoder().decode(Posts.self, from: data)  as? T else {
                            completionHandler(NetworkResult.failure(error!))
                            break
                        }
                        completionHandler(NetworkResult.success(decode))
                    }
                }
                catch { completionHandler(NetworkResult.failure(error)) }
            }
        }
        task.resume()
    }
}
