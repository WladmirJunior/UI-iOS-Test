//
//  MainCoordinator.swift
//  InterMovies
//
//  Created by Wladmir Edmar Silva Junior on 11/08/21.
//

import UIKit

public class MainCoordinator {
    lazy var mainNavigation: UINavigationController = {
        return UINavigationController()
    }()
    
    lazy var serviceProtocol: APIClientProtocol = {
        return APIClient()
    }()
}

extension MainCoordinator: StartViewControllerDelegate {
    func goToMainScreen(_ startViewController: StartViewController) {
        let getPopularMovieUseCase = GetPopularMoviesUseCase(service: serviceProtocol)
        let viewModel = MainViewModel(getPopularUseCase: getPopularMovieUseCase)
        let mainViewController = MainViewController(viewModel: viewModel)
        viewModel.viewController = mainViewController
        mainViewController.delegate = self
        mainNavigation = UINavigationController(rootViewController: mainViewController)
        mainNavigation.modalPresentationStyle = .fullScreen
        startViewController.present(mainNavigation, animated: true)
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func goToMovieDetailScreen(_ mainViewController: MainViewController, movieId: Int) {
        let detailViewController = MovieDetailViewController(movieId: movieId)
        mainNavigation.pushViewController(detailViewController, animated: true)
    }
}
