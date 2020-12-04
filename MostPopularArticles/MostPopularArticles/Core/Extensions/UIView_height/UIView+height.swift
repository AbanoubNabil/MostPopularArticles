//
//  UIView+height.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/4/20.
//

import UIKit

extension UIView {
	@IBInspectable var viewBorderColor: UIColor? {
		get {
			guard let color = layer.borderColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
			guard let color = newValue else {
				layer.borderColor = nil
				return
			}
			guard String(describing: type(of: color)) != "__NSCFType" else { return }
			layer.borderColor = color.cgColor
		}
	}

	@IBInspectable var viewBorderWidth: CGFloat {
		get {
			layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable var cornerRadius: CGFloat {
		get {
			layer.cornerRadius
		}
		set {
			layer.masksToBounds = true
			layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
		}
	}

	var height: CGFloat {
		get {
			frame.size.height
		}
		set {
			frame.size.height = newValue
		}
	}

	var width: CGFloat {
		get {
			frame.size.width
		}
		set {
			frame.size.width = newValue
		}
	}
}

extension UIView {
	func fillInView(_ container: UIView!) {
		translatesAutoresizingMaskIntoConstraints = false
		frame = container.frame
		container.addSubview(self)
		NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
		NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
		NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
		NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
	}
}
