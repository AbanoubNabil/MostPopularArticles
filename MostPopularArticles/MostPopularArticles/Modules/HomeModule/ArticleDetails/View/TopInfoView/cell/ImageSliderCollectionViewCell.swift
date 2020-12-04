//
//  ImageSliderCollectionViewCell.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import UIKit
import Kingfisher

class ImageSliderCollectionViewCell: UICollectionViewCell {

	// Marrk: - Outlets
	@IBOutlet var fullImageView: UIImageView!
	@IBOutlet var centerImageView: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	func setup(with model: String) {
		centerImageView.kf.indicatorType = .activity
		centerImageView.kf.setImage(with: URL(string: model))
	}

}
