//
//  StartViewController.swift
//  InterMovies
//
//  Created by Wladmir Edmar Silva Junior on 11/08/21.
//

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    func goToMainScreen(_ startViewController: StartViewController)
}

class StartViewController: UIViewController {

    enum Constants {
        static let buttonTitle = "Explore já"
        static let subtitle = "Milhões de filmes e séries para descobrir. Esperimente por 7 dias."
    }

    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .movies
        return imageView
    }()

    private lazy var brandImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .logo
        return imageView
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = Constants.subtitle
        return label
    }()

    private lazy var centerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(clickToExplore), for: .touchUpInside)
        return button
    }()

    weak var delegate: StartViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - UI

    private func setup() {
        setupUI()
        buildViewHierarchy()
        addConstraints()
    }

    private func setupUI() {
        view.backgroundColor = .white
    }

    private func buildViewHierarchy() {
        view.addSubview(contentView)
        contentView.addSubview(movieImage)
        contentView.addSubview(brandImage)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(centerButton)
    }

    private func addConstraints() {

        contentView.centerYTo(view.centerYAnchor)
            .centerXTo(view.centerXAnchor)
            .leadingTo(view.leadingAnchor)
            .trailingTo(view.trailingAnchor)

        movieImage.topTo(contentView.topAnchor)
            .centerXTo(contentView.centerXAnchor)

        brandImage.centerXTo(contentView.centerXAnchor)
            .topTo(movieImage.bottomAnchor, constant: Metrics.medium)

        subtitleLabel.topTo(brandImage.bottomAnchor, constant: Metrics.small)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.big)
            .trailingTo(contentView.trailingAnchor, constant: Metrics.big)

        centerButton.centerXTo(contentView.centerXAnchor)
            .topTo(subtitleLabel.bottomAnchor, constant: Metrics.big)
            .bottomTo(contentView.bottomAnchor)
    }

    // MARK: - ACTIONS

    @objc private func clickToExplore() {
        delegate?.goToMainScreen(self)
    }
}

