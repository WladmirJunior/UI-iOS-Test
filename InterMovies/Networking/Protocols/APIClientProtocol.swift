//
//  APIClientProtocol.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//

import Foundation
import RxSwift

public enum ServiceResponseError: Error {
    case invalidUrl
    case erro404(String)
    case errorGeneric(String)
    case parseError(String)
    case empty
}

protocol APIClientProtocol {
    func execute<T: Codable>(request: RequestProtocol, responseType: T.Type) -> Observable<T>
}
