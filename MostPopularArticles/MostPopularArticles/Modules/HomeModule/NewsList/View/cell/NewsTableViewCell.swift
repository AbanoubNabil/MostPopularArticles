//
//  NewsTableViewCell.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

	@IBOutlet weak var articleTitle: UILabel!
	@IBOutlet weak var articleSubtitle: UILabel!
	@IBOutlet weak var articleDate: UILabel!
	@IBOutlet weak var articleImage: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func setUp(news: NewsArticle?) {
		guard let news = news else {
			return
		}
		self.articleTitle.text = news.title
		self.articleSubtitle.text = news.byline
		self.articleDate.text = news.published_date
	}
	
}
