//
// 
//  GetPopularMoviesUseCase.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//
//

import Foundation
import RxSwift

class GetPopularMoviesUseCase {
 
    private let disposeBag = DisposeBag()
    private let service: APIClientProtocol
    
    public init(service: APIClientProtocol) {
        self.service = service
    }
}

extension GetPopularMoviesUseCase: GetPopularMoviesUseCaseProtocol {
 
    public func execute() -> Observable<GetPopularMoviesUseCaseResponse> {
        let observer = ReplaySubject<GetPopularMoviesUseCaseResponse>.create(bufferSize: 1)
        let request = InterMoviesServices.getPopularMovies
        service.execute(request: request, responseType: GetPopularMoviesUseCaseResponse.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { result in
                observer.onNext(result)
            }, onError: { error in
                observer.onError(error)
            }).disposed(by: disposeBag)
        return observer
    }
}
