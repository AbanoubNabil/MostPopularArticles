//
//  NYTMostViewdArticlesViewController.swift
//  MostPopularArticles
//
//  Created Abanoub Nabil on 12/3/20.
//  Copyright © 2020 Abanoub Nabil. All rights reserved.
//

import UIKit

class NYTMostViewdArticlesViewController: BaseViewController {

	@IBOutlet weak var newsTableView: UITableView!

	// MARK: instance variiables.
	let searchController = UISearchController(searchResultsController: nil)
	var presenter: NYTMostViewdArticlesPresenterProtocol?

	var isFiltering: Bool {
		return searchController.isActive && !(searchController.searchBar.text?.isEmpty ?? false)
	}

	override func viewDidLoad() {
        super.viewDidLoad()
		setUpUI()
		presenter?.getMostViewdNews(period: .month)
    }

	func setUpUI() {
		self.setNavigationWith(title: presenter?.screenTitle)
		setupSearchBar()
		regisetrNewsCell()
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		.default
	}

	func regisetrNewsCell() {
		let nib = UINib(nibName: "\(NewsTableViewCell.self)", bundle: nil)
		newsTableView.register(nib, forCellReuseIdentifier: "\(NewsTableViewCell.self)")
	}

}

// MARK: delegate Methods
extension NYTMostViewdArticlesViewController: NYTMostViewdArticlesViewProtocol {

	func reloadDate() {
		newsTableView.reloadData()
	}

	func startLoadingAnimation() {
		startAnimating()
	}

	func stopLoadingAnimation() {
		stopAnimating()
	}
}

// MARK: TAble View Methods
extension NYTMostViewdArticlesViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.newsCount ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsTableViewCell.self)") as? NewsTableViewCell
		cell?.setUp(news: presenter?.getArticle(at: indexPath.row))
		return cell ?? UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter?.didTapedCell(at: indexPath.row)
	}
}

// MARK: NavigationBar Customization Methods
extension NYTMostViewdArticlesViewController {

	private func setNavigationWith(title: String?) {
		let titleLabel = UILabel.init(frame: CGRect(x: 120, y: 24, width: UIScreen.main.bounds.width, height: 25))
		titleLabel.text = title
		titleLabel.textColor = .white

		let burger = createTapBarButton(image: #imageLiteral(resourceName: "burger"), selector: #selector(buttonTaped))
		let search = createTapBarButton(image: #imageLiteral(resourceName: "search"), selector: #selector(searchTapped))
		let dots = createTapBarButton(image: #imageLiteral(resourceName: "dots"), selector: #selector(buttonTaped))
		burger.tintColor = .white
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]
		navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.9972651601, blue: 0.7278878093, alpha: 1)
		navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.9972651601, blue: 0.7278878093, alpha: 1)
		navigationItem.titleView = titleLabel
		navigationItem.rightBarButtonItems = [dots, search]
		navigationItem.leftBarButtonItems = [burger]
	}

	func createTapBarButton(image: UIImage, selector: Selector) -> UIBarButtonItem {
		let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
		button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
		button.tintColor = .white
		button.addTarget(self, action: selector, for: .touchUpInside)
		return UIBarButtonItem(customView: button)
	}

	@objc func buttonTaped() {
		let actionSheetController: UIAlertController = UIAlertController(title: "Select Articles Period", message: nil, preferredStyle: .actionSheet)

		let cancelAction = UIAlertAction(title: presenter?.localization.cancel, style: .cancel)

		let forDay = UIAlertAction(title: presenter?.localization.forDay, style: .default) { _ in
			self.presenter?.getMostViewdNews(period: .day)
		}

		let forWeek = UIAlertAction(title: presenter?.localization.forWeek, style: .default) { _ in
			self.presenter?.getMostViewdNews(period: .week)
		}

		let forMonth = UIAlertAction(title: presenter?.localization.forMonth, style: .default) { _ in
			self.presenter?.getMostViewdNews(period: .month)
		}

		actionSheetController.addAction(forDay)
		actionSheetController.addAction(forWeek)
		actionSheetController.addAction(forMonth)
		actionSheetController.addAction(cancelAction)

		self.present(actionSheetController, animated: true, completion: nil)
	}

	@objc func searchTapped() {
		if #available(iOS 13.0, *) {
			searchController.searchBar.searchTextField.becomeFirstResponder()
		}
	}

}

extension NYTMostViewdArticlesViewController: UISearchResultsUpdating {

	func setupSearchBar() {
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = presenter?.localization.searchPlaceholder
		navigationItem.searchController = searchController
		definesPresentationContext = true
	}

	func updateSearchResults(for searchController: UISearchController) {
		let searchBar = searchController.searchBar
		presenter?.filterContentForSearchText(searchBar.text ?? "")
	}

}
