//
//  Stub.swift
//  swift practice guide
//
//  Created by riku on 2021/04/24.
//

import Foundation

public protocol HTTPClient {
    func fetchContents(of url: URL, completion: @escaping (Result<(Data,HTTPURLResponse), Error>) -> Void)
}

extension URLSession: HTTPClient {
    public func fetchContents(of url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let task = dataTask(with: url) { urlResponse, data, error in
            switch (urlResponse, data, error) {
            case (let data?, let urlResponse as HTTPURLResponse, _):
                completion(.success((data, urlResponse)))
            case (_, _, let error?):
                completion(.failure(error))
            default:
                fatalError()
            }
        }
        task.resume()
    }
}

class StatusFetcher {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func fetchStatus(of url: URL, completion: @escaping (Result<Int, Error>) -> Void) {
        httpClient.fetchContents(of: url) { result in
            switch result {
            case .success((_, let urlResponse)):
                completion(.success(urlResponse.statusCode))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
