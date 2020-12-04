//
//  ArticleDetailsViewModel.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import Foundation

struct ArticleDetailsViewModel {

	var newsArticle: NewsArticle?

	init(article: NewsArticle) {
		newsArticle = article
	}

	var articleImages: [String]? {
		return newsArticle?.media?.first?.mediaMetadata?.compactMap({$0.url})
	}

	var articleTitle: String {
		return newsArticle?.title ?? ""
	}

	var articleDate: String {
		return newsArticle?.publishedDate ?? ""
	}

	var articleSection: String {
		return "\(newsArticle?.section ?? "") \(newsArticle?.type ?? "")"
	}

	var articleAbstract: String {
		return newsArticle?.abstract ?? ""
	}

	var articleByLine: String {
		return newsArticle?.byline ?? ""
	}
}
