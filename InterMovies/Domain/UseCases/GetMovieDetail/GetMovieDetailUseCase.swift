//
// 
//  GetMovieDetailUseCase.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 18/08/21.
//
//

import Foundation
import RxSwift

class GetMovieDetailUseCase {
 
    private let disposeBag = DisposeBag()
    private let service: APIClientProtocol
    
    public init(service: APIClientProtocol) {
        self.service = service
    }
}

extension GetMovieDetailUseCase: GetMovieDetailUseCaseProtocol {
 
    public func execute(_ movie: Movie) -> Observable<GetMovieDetailUseCaseResponse> {
        let observer = ReplaySubject<GetMovieDetailUseCaseResponse>.create(bufferSize: 1)
        let request = InterMoviesServices.getDetailMovie(id: movie.id.description)
        service.execute(request: request, responseType: GetMovieDetailUseCaseResponse.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { result in
                observer.onNext(result)
            }, onError: { error in
                observer.onError(error)
            }).disposed(by: disposeBag)
        return observer
    }
}
