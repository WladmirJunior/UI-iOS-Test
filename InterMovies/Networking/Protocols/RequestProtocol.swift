//
//  Request.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum AuthorizationType {
    case withApiKey
    case none
}

protocol RequestProtocol {
    var route: String { get }
    var method: HttpMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
    var authorization: AuthorizationType { get }
}
