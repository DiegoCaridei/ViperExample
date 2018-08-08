//
//  DetailPostRouter.swift
//  ViperPost
//
//  Created Diego.Caridei on 08/08/2018.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//


import UIKit

class DetailPostRouter: DetailPostWireframeProtocol {

    weak var viewController: UIViewController?

    static func createPostDetailModule(forPost post: PostElement) -> UIViewController {

        let viewController = mainStoryboard.instantiateViewController(withIdentifier: Router.detailPostVC)
        guard let view = viewController as? DetailPostViewController else { fatalError() }

        let interactor = DetailPostInteractor()
        let router = DetailPostRouter()
        let presenter = DetailPostPresenter(interface: view, interactor: interactor, router: router)
        presenter.post = post
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
