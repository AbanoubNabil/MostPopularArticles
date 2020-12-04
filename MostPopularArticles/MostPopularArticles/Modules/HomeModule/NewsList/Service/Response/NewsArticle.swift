/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy , modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject
to the following conditions:The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR OTHER DEALINGS IN THE SOFTWARE. For support, please feel free to contact
me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct NewsArticle: Codable {
	let uri: String?
	let url: String?
	let articleID: Int?
	let assetId: Int?
	let source: String?
	let publishedDate: String?
	let updated: String?
	let section: String?
	let subsection: String?
	let nytdsection: String?
	let adxKeywords: String?
	let column: String?
	let byline: String?
	let type: String?
	let title: String?
	let abstract: String?
	let desFacet: [String]?
	let orgFacet: [String]?
	let perFacet: [String]?
	let geoFacet: [String]?
	let media: [Media]?
	let etaId: Int?

	enum CodingKeys: String, CodingKey {

		case uri = "uri"
		case url = "url"
		case articleID = "id"
		case assetId = "asset_id"
		case source = "source"
		case publishedDate = "published_date"
		case updated = "updated"
		case section = "section"
		case subsection = "subsection"
		case nytdsection = "nytdsection"
		case adxKeywords = "adx_keywords"
		case column = "column"
		case byline = "byline"
		case type = "type"
		case title = "title"
		case abstract = "abstract"
		case desFacet = "des_facet"
		case orgFacet = "org_facet"
		case perFacet = "per_facet"
		case geoFacet = "geo_facet"
		case media = "media"
		case etaId = "eta_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		articleID = try values.decodeIfPresent(Int.self, forKey: .articleID)
		assetId = try values.decodeIfPresent(Int.self, forKey: .assetId)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
		nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
		adxKeywords = try values.decodeIfPresent(String.self, forKey: .adxKeywords)
		column = try values.decodeIfPresent(String.self, forKey: .column)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
		desFacet = try values.decodeIfPresent([String].self, forKey: .desFacet)
		orgFacet = try values.decodeIfPresent([String].self, forKey: .orgFacet)
		perFacet = try values.decodeIfPresent([String].self, forKey: .perFacet)
		geoFacet = try values.decodeIfPresent([String].self, forKey: .geoFacet)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
		etaId = try values.decodeIfPresent(Int.self, forKey: .etaId)
	}

}
