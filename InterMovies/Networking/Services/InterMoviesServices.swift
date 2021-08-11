//
//  InterMoviesServices.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//

import Foundation

enum InterMoviesServices: RequestProtocol {
    case getPopularMovies
    case getTopRatedMovies
    case getDetailMovie(id: String)
    
    var route: String {
        let base: String = "https://api.themoviedb.org/3"
        switch self {
        case .getPopularMovies: return "\(base)/movie/popular"
        case .getTopRatedMovies: return "\(base)/movies/top_rated"
        case let .getDetailMovie(id): return "\(base)/movie/\(id)"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return .get
        }
    }
    
    var body: Data? {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return nil
        }
    }
    
    var authorization: AuthorizationType {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return .withApiKey
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getPopularMovies,
             .getTopRatedMovies,
             .getDetailMovie:
            return nil
        }
    }
}
