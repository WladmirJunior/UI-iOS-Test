//
// 
//  GetPopularMoviesUseCaseResponse.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//
//

import Foundation

public struct GetPopularMoviesUseCaseResponse: Codable {
    public let page: Int
    public let results: [GetPopularMoviesData]?
}

public struct GetPopularMoviesData: Codable {
    public let id: Int
    public let title: String
    public let overview: String?
    public let backdrop_path: String?
    public let release_date: String
    public let genre_ids: [Int]
}
