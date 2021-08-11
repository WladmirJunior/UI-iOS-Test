//
//  MovieDetailViewController.swift
//  InterMovies
//
//  Created by Wladmir Edmar Silva Junior on 11/08/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    enum Constants {
        static let watchButtonTitle = "Assistir"
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
        imageView.image = .banner
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.text = "The Lord of the Rings The Two Towers"
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
        label.text = """
        Após a captura de Merry e Pippy pelos orcs, a Sociedade do Anel é dissolvida.
        Frodo e Sam seguem sua jornada rumo à Montanha da Perdição para destruir o anel e descobrem que estão sendo perseguidos
        pelo misterioso Gollum. Enquanto isso, Aragorn, o elfo e arqueiro Legolas e o anão Gimli partem para resgatar
        os hobbits sequestrados e chegam ao reino de Rohan, onde o rei Theoden foi vítima de uma maldição mortal de Saruman.
        """
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
    }

    // MARK: - INITIALIZERS

    public init(movieId: Int) {
        super.init(nibName: nil, bundle: nil)
        //viewModel.getDetails(with: movieId)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
}
