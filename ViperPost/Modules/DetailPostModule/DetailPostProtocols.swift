//
//  DetailPostProtocols.swift
//  ViperPost
//
//  Created Diego.Caridei on 08/08/2018.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//


import UIKit

//MARK: Wireframe -
protocol DetailPostWireframeProtocol: class {
    static func createPostDetailModule(forPost post: PostElement) -> UIViewController

}
//MARK: Presenter -
protocol DetailPostPresenterProtocol: class {

    var interactor: DetailPostInteractorInputProtocol? { get set }
    var post: PostElement? { get set }
    func viewDidLoad()

}

//MARK: Interactor -
protocol DetailPostInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
}

protocol DetailPostInteractorInputProtocol: class {
    var presenter: DetailPostInteractorOutputProtocol?  { get set }
    /* Presenter -> Interactor */
}

//MARK: View -
protocol DetailPostViewProtocol: class {

    var presenter: DetailPostPresenterProtocol?  { get set }
    func showPostDetail(forPost post: PostElement)

    /* Presenter -> ViewController */
}
