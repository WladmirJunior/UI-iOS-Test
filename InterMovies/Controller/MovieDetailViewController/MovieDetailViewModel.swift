//
//  MovieDetailViewModel.swift
//  InterMovies
//
//  Created by Pablo Ruan Ribeiro Silva on 18/08/21.
//
import RxSwift
import Foundation

protocol MovieDetailViewModelType {
    func initState()
}

class MovieDetailViewModel: MovieDetailViewModelType {
    
    weak var viewController: MovieDetailViewControllerType?
    private let disposeBag = DisposeBag()
    
    let getDetailMovieUseCase: GetMovieDetailUseCaseProtocol
    let movie: Movie
    
    enum Constants {
        static let imageSize = "w500/"
        static let basePathImage = "https://image.tmdb.org/t/p/"
    }
    
    public init(movie: Movie,
                getDetailMovieUseCase: GetMovieDetailUseCaseProtocol) {
        self.movie = movie
        self.getDetailMovieUseCase = getDetailMovieUseCase
    }
    
    func initState() {
        getDetailMovieUseCase.execute(movie)
            .subscribe { [weak self] result in
                self?.showScreen(result)
            } onError: { error in
                print(error)
            }.disposed(by: disposeBag)
    }
    
    private func showScreen(_ result: GetMovieDetailUseCaseResponse?) {
        guard let data = result else { return }
        // Aqui podemos obeter mais informações, bem como categoria, data de release, elenco, produtores
        // vide detalhes em https://developers.themoviedb.org/3/movies/get-movie-details
        let posterImagem = URL(string: Constants.basePathImage+Constants.imageSize+(data.posterPath ?? data.backdropPath))
        let imageBackground = URL(string: Constants.basePathImage+Constants.imageSize+data.backdropPath)
        let movieDetail = MovieDetail(
            title: data.title,
            description: data.overview,
            backgroundImage: imageBackground,
            posterImage: posterImagem
        )
        viewController?.updateMovie(with: movieDetail)
    }
}
