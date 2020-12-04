//
//  TopInfoView.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import UIKit

class TopInfoView: UIView {
	// MARK: - Outlets
	@IBOutlet var contentView: UIView!
	@IBOutlet var imagesCollectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	// MARK: - Properties
	
	var headerImages: [String] = [] {
		didSet {
			pageControl.numberOfPages = headerImages.count
			imagesCollectionView.reloadData()
		}
	}

	// MARK: - Properties

	private let xibName = String(describing: TopInfoView.self)

	// MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}

	// MARK: - Functions

	private func commonInit() {
		Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
		contentView.fillInView(self)
	}

	func setup(with headerImages: [String]) {
		imagesCollectionView.delegate = self
		imagesCollectionView.dataSource = self
		registerCollectionViewCell()
		setupCollectionViewLayout()
		self.headerImages = headerImages
	}
}

extension TopInfoView {
	private func registerCollectionViewCell() {
		let nib = UINib(nibName: "\(ImageSliderCollectionViewCell.self)", bundle: nil)
		imagesCollectionView.register(nib, forCellWithReuseIdentifier: "\(ImageSliderCollectionViewCell.self)")
	}

	private func setupCollectionViewLayout() {
		let layout = UICollectionViewFlowLayout()
		let itemWidth = UIScreen.main.bounds.width
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		let itemHeight = imagesCollectionView.height - 1
		layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
		layout.headerReferenceSize = CGSize(width: 0, height: 0)
		layout.footerReferenceSize = CGSize(width: 0, height: 0)
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0
		layout.scrollDirection = .horizontal
		imagesCollectionView.collectionViewLayout = layout
		imagesCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
	}
}

extension TopInfoView: UICollectionViewDataSource,
	UICollectionViewDelegate {
	func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
		headerImages.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ImageSliderCollectionViewCell.self)", for: indexPath) as? ImageSliderCollectionViewCell ?? ImageSliderCollectionViewCell()
		if headerImages.count > indexPath.row {
			let imageHeader = headerImages[indexPath.row]
			cell.setup(with: imageHeader)
		}
		return cell
	}

	func scrollViewWillEndDragging(_: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let pageWidth = Float(width)
		let targetXContentOffset = Float(targetContentOffset.pointee.x)
		let contentWidth = Float(self.imagesCollectionView.contentSize.width)
		var newPage = Float(self.pageControl.currentPage)

		if velocity.x == 0 {
			newPage = floor((targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
		} else {
			newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
			if newPage < 0 {
				newPage = 0
			}
			if newPage > contentWidth / pageWidth {
				newPage = ceil(contentWidth / pageWidth) - 1.0
			}
		}
		self.pageControl.currentPage = Int(newPage)
		let point = CGPoint(x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
		targetContentOffset.pointee = point
	}
}
