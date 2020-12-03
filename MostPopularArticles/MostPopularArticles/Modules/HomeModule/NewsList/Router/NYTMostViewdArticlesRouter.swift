//
//  NYTMostViewdArticlesRouter.swift
//  MostPopularArticles
//
//  Created Abanoub Nabil on 12/3/20.
//  Copyright © 2020 Abanoub Nabil. All rights reserved.
//


import UIKit

class NYTMostViewdArticlesRouter: NYTMostViewdArticlesWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = NYTMostViewdArticlesViewController(nibName: nil, bundle: nil)
        let interactor = NYTMostViewdArticlesInteractor()
        let router = NYTMostViewdArticlesRouter()
        let presenter = NYTMostViewdArticlesPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
