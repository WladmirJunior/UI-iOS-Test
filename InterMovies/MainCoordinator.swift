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
}

extension MainCoordinator: StartViewControllerDelegate {
    func goToMainScreen(_ startViewController: StartViewController) {
        let mainViewController = MainViewController()
        mainNavigation = UINavigationController(rootViewController: mainViewController)
        mainNavigation.modalPresentationStyle = .fullScreen
        startViewController.present(mainNavigation, animated: true)
    }
}
