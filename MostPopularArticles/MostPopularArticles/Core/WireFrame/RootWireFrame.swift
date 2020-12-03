//
//  RootWireFrame.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import UIKit

class RootWireframe {
	
	// MARK: - Instance Variables
	lazy var moduleNavigationController = UINavigationController ()

	init(onWindow window: inout UIWindow?) {
		if window == nil {
			window = UIWindow()
		}
		setApplicationRoot(window: window!)
	}
	/**
	use this method to add any checks for diferrent root setup
	*/
	
	func setApplicationRoot(window: UIWindow) {
		setUpHomeScreen(window: window)
		window.makeKeyAndVisible()
	}

	func setUpHomeScreen(window: UIWindow) {
		let landingScreen = UIViewController()
		moduleNavigationController.isNavigationBarHidden = true
		moduleNavigationController.viewControllers = [landingScreen]
		window.rootViewController = moduleNavigationController
	}
	
}
