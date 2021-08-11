//
//  APIClient.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//

import Foundation
import RxSwift

class APIClient: APIClientProtocol {
    
    private enum Constants {
        static let apiKey = "api_key"
        static let language = "language"
        static let key = "c2e78b4a8c14e65dd6e27504e6df95ad"
        static let languageType = "pt-BR"
    }
    
    func execute<T: Codable>(request: RequestProtocol, responseType: T.Type) -> Observable<T> {
        return Observable.create { [weak self] observer in
            if var urlRequest = self?.makeUrlRequest(request) {
                urlRequest.httpMethod = request.method.rawValue
                urlRequest.httpBody = request.body
                urlRequest.allHTTPHeaderFields = request.headers
                debugPrint(urlRequest)
                let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    do {
                        if let dataResponse = data {
                            let json = try JSONDecoder().decode(responseType.self, from: dataResponse)
                            observer.onNext(json)
                        } else {
                            observer.onError(ServiceResponseError.errorGeneric("No data"))
                        }
                    } catch {
                        observer.onError(ServiceResponseError.parseError(error.localizedDescription))
                    }
                    observer.onCompleted()
                }
                session.resume()
            } else {
                observer.onError(ServiceResponseError.invalidUrl)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func makeUrlRequest(_ request: RequestProtocol) -> URLRequest? {
        guard var urlComponent = URLComponents(string: request.route)
        else { return nil }
        switch request.authorization {
        case .none:
            urlComponent.queryItems = [
                URLQueryItem(name: Constants.language, value: Constants.languageType),
            ]
        case .withApiKey:
            urlComponent.queryItems = [
                URLQueryItem(name: Constants.apiKey, value: Constants.key),
                URLQueryItem(name: Constants.language, value: Constants.languageType),
            ]
        }
        guard let url = urlComponent.url
        else { return nil }
        return URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
    }
}
