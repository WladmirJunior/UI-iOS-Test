//
// 
//  GetPopularMoviesUseCaseProtocol.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//
//

import RxSwift
import Foundation

protocol GetPopularMoviesUseCaseProtocol: AnyObject {
    func execute() -> Observable<GetPopularMoviesUseCaseResponse>
}
