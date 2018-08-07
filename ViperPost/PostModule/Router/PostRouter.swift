//
//  PostRouter.swift
//  ViperPost
//
//  Created Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit

class PostRouter: PostWireframeProtocol {

    weak var viewController: UIViewController?
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:Router.mainStoryboard, bundle: Bundle.main)
    }

    static func createModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: Router.mainNavigation)
        guard let view = navController.childViewControllers.first as? PostViewController else { fatalError()}
        let interactor = PostInteractor()
        let router = PostRouter()
        let presenter = PostPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
