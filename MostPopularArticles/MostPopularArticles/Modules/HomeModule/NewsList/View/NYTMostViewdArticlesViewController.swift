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
	
	var presenter: NYTMostViewdArticlesPresenterProtocol?
	let searchController = UISearchController(searchResultsController: nil)
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setUpUI()
		presenter?.getMostViewdNews()
	}
	
	func setUpUI() {
		regisetrNewsCell()
		setUpSearchBar()
		setupNavigationBar(title: "NY Times Most Popular")
		hideSearchBar()
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		.default
	}
	
	func regisetrNewsCell() {
		let nib = UINib(nibName: "\(NewsTableViewCell.self)", bundle: nil)
		newsTableView.register(nib, forCellReuseIdentifier: "\(NewsTableViewCell.self)")
	}
	
	func setUpSearchBar() {
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Search Articles"
		navigationItem.searchController = searchController
		definesPresentationContext = true
	}

	func hideSearchBar() {
		self.searchController.searchBar.isHidden = true
		self.newsTableView.tableHeaderView = nil
		newsTableView.setNeedsLayout()
	}
	
	func showSearchBar() {
		self.searchController.searchBar.isHidden = false
		self.newsTableView.tableHeaderView = self.searchController.searchBar;
	}
	
}

extension NYTMostViewdArticlesViewController: NYTMostViewdArticlesViewProtocol{
	
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

extension NYTMostViewdArticlesViewController : UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.newsCount ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsTableViewCell.self)") as? NewsTableViewCell
		cell?.setUp(news: presenter?.getArticle(at: indexPath.row))
		return cell ?? UITableViewCell()
	}
	
}

extension NYTMostViewdArticlesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
	// TODO
  }
}
