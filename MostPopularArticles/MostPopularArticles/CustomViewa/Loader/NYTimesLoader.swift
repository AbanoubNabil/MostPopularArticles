//
//  NYTimesLoader.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import UIKit

class NYLoadingIndicatorView: UIView {

	// views
	lazy var imageView: UIImageView = { UIImageView() }()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupUI()
	}
}

// MARK: - UI Setup

extension NYLoadingIndicatorView {
	private func setupUI() {
		setupContentView()
		setupIndicatorImageView()
	}

	private func setupContentView() {
		backgroundColor = .white
		layer.masksToBounds = true
		layer.cornerRadius = 35
		layer.borderColor = UIColor.black.cgColor
		layer.borderWidth = 1.0
	}

	private func setupIndicatorImageView() {
		setupIndicatorImageViewConstraints()
		var animationImages = [UIImage]()
		for index in 0 ... 18 {
			animationImages.append(UIImage(named: "frame-\(index)") ?? UIImage())
		}
		imageView.animationImages = animationImages.compactMap { $0 }
		imageView.animationDuration = 1
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
	}

	private func setupIndicatorImageViewConstraints() {
		addSubview(imageView)
		imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		bringSubviewToFront(imageView)
	}
}

// MARK: - Controls

extension NYLoadingIndicatorView {
	func startAnimating() {
		imageView.startAnimating()
		isHidden = false
	}

	func stopAnimating() {
		imageView.stopAnimating()
		isHidden = true
	}
}
