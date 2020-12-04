//
//  NYTMostViewdArticlesViewController.swift
//  MostPopularArticles
//
//  Created Abanoub Nabil on 12/3/20.
//  Copyright © 2020 Abanoub Nabil. All rights reserved.
//

import UIKit

class NYTMostViewdArticlesViewController: UIViewController {

	@IBOutlet weak var newsTableView: UITableView!

	var presenter: NYTMostViewdArticlesPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
		regisetrNewsCell()
		presenter?.getMostViewdNews()
    }

	func regisetrNewsCell() {
		let nib = UINib(nibName: "\(NewsTableViewCell.self)", bundle: nil)
		newsTableView.register(nib, forCellReuseIdentifier: "\(NewsTableViewCell.self)")
	}

}

extension NYTMostViewdArticlesViewController: NYTMostViewdArticlesViewProtocol {

	func reloadDate() {
		newsTableView.reloadData()
	}

	func startLoadingAnimation() {

	}

	func stopLoadingAnimation() {

	}
}

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
