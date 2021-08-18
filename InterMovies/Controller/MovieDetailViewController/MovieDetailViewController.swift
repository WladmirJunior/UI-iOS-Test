//
//  MovieDetailViewController.swift
//  InterMovies
//
//  Created by Wladmir Edmar Silva Junior on 11/08/21.
//

import UIKit
import Kingfisher

protocol MovieDetailViewControllerType: AnyObject {
    func updateMovie(with movie: MovieDetail)
}

class MovieDetailViewController: UIViewController {

    enum Constants {
        static let watchButtonTitle = "Assistir"
    }
    
    public var viewModel: MovieDetailViewModelType?
    
    public init(viewModel: MovieDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var imageBanner: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.text = "Sinopse"
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    private lazy var buttonWatch: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.watchButtonTitle, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel?.initState()
    }
    // MARK: - UI

    private func setup() {
        setupUI()
        buildViewHierarchy()
        addConstraints()
    }

    private func setupUI() {
        view.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
    }

    private func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageBanner)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buttonWatch)
    }

    private func addConstraints() {
        scrollView.constraintToSuperview()
        contentView.constraintToSuperview()

        contentView.width(view.widthAnchor)
        let contentViewHeightConstant = contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        contentViewHeightConstant.priority = .defaultLow
        contentViewHeightConstant.isActive = true

        imageBanner.topTo(contentView.topAnchor)
            .leadingTo(contentView.leadingAnchor)
            .trailingTo(contentView.trailingAnchor)
            .height(540)

        titleLabel.topTo(imageBanner.bottomAnchor, constant: Metrics.small)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.medium)
            .trailingTo(contentView.trailingAnchor, constant: Metrics.medium)

        subtitleLabel.topTo(titleLabel.bottomAnchor, constant: Metrics.huge)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.medium)

        descriptionLabel.topTo(subtitleLabel.bottomAnchor, constant: Metrics.small)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.medium)
            .trailingTo(contentView.trailingAnchor, constant: Metrics.medium)

        buttonWatch.topTo(descriptionLabel.bottomAnchor, constant: Metrics.medium)
            .leadingTo(contentView.leadingAnchor, constant: Metrics.medium)
            .trailingTo(contentView.trailingAnchor, constant: Metrics.medium)
            .height(48)
            .bottomTo(contentView.bottomAnchor, constant: Metrics.medium)
    }

    // Call after get details
    private func updateView(with detail: MovieDetail) {
        titleLabel.text = detail.title
        descriptionLabel.text = detail.description
        imageBanner.kf.setImage(with: detail.posterImage)
    }
}

extension MovieDetailViewController: MovieDetailViewControllerType {
    func updateMovie(with movie: MovieDetail) {
        updateView(with: movie)
    }
}
