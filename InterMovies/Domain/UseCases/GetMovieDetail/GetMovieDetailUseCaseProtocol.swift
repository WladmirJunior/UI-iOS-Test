//
// 
//  GetMovieDetailUseCaseProtocol.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 18/08/21.
//
//

import RxSwift
import Foundation

public protocol GetMovieDetailUseCaseProtocol: AnyObject {
    func execute(_ movie: Movie) -> Observable<GetMovieDetailUseCaseResponse>
}
