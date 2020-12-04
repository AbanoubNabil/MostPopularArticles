//
//  BaseControllerProtocol.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import UIKit


class BaseViewController: UIViewController{
	
	lazy var indicatorView: NYLoadingIndicatorView = { NYLoadingIndicatorView() }()
	private let titleLeading: CGFloat = 120.0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupIndicatorViewUI()
	}
	
	func startAnimating() {
		DispatchQueue.main.async { [weak self] in
			self?.indicatorView.startAnimating()
			self?.view.isUserInteractionEnabled = false
		}
	}

	func stopAnimating() {
		DispatchQueue.main.async { [weak self] in
			self?.indicatorView.stopAnimating()
			self?.view.isUserInteractionEnabled = true
		}
	}

	func setupNavigationBar(title: String?) {
		navigationController?.isNavigationBarHidden = false
		setNavigationWith(title: title)
	}

	private func setNavigationWith(title: String?) {
		let titleLabel = UILabel.init(frame: CGRect(x: titleLeading , y: 20, width: UIScreen.main.bounds.width - titleLeading, height: 30))
		titleLabel.text = title
		navigationItem.titleView = titleLabel
	}

	
	func setupIndicatorViewUI() {
		view.addSubview(indicatorView)
		indicatorView.translatesAutoresizingMaskIntoConstraints = false
		indicatorView.heightAnchor.constraint(equalToConstant: 70).isActive = true
		indicatorView.widthAnchor.constraint(equalToConstant: 70).isActive = true
		indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		indicatorView.isHidden = true
	}
	
}
