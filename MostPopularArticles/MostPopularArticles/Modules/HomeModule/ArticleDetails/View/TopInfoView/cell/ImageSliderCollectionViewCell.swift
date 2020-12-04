//
//  ImageSliderCollectionViewCell.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import UIKit

class ImageSliderCollectionViewCell: UICollectionViewCell {

	// Marrk: - Outlets
	@IBOutlet var fullImageView: UIImageView!
	@IBOutlet var centerImageView: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	func setup(with model: String) {
//		fullImageView.kf.indicatorType = model.url == nil ? .none : .activity
//		centerImageView.kf.indicatorType = model.url == nil ? .none : .activity
//		fullImageView.kf.setImage(with: model.url, placeholder: UIImage(named: "logoViche"))
//		centerImageView.kf.setImage(with: model.centerImageURL)
	}

}
