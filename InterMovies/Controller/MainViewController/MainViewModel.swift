//
//  MainViewModel.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 11/08/21.
//
import RxSwift
import Foundation

protocol MainViewModelType {
    func initState()
}

class MainViewModel: MainViewModelType {
    
    weak var viewController: MainViewControllerType?
    let getPopularUseCase: GetPopularMoviesUseCaseProtocol
    private let disposeBag = DisposeBag()
    
    public init(getPopularUseCase: GetPopularMoviesUseCaseProtocol) {
        self.getPopularUseCase = getPopularUseCase
    }
    
    func initState() {
        getPopularUseCase.execute()
            .subscribe { [weak self] result in
                self?.showScreen(result)
            } onError: { error in
                print(error)
            }.disposed(by: disposeBag)
    }
    
    private func showScreen(_ result: GetPopularMoviesUseCaseResponse?) {
        guard let data = result else { return }
        let movies = data.results?.compactMap { movie in
            Movie(title: movie.title,
                  id: movie.id,
                  image: URL(string: movie.backdrop_path ?? ""),
                  releaseDate: movie.release_date,
                  categories: movie.genre_ids.map { $0.description }
            )
        } ?? []
        viewController?.updateMovies(with: movies)
    }
}
