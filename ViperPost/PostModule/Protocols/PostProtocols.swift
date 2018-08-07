//
//  PostProtocols.swift
//  ViperPost
//
//  Created Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol PostWireframeProtocol: class {
    static func createModule() -> UIViewController
}
//MARK: Presenter -
protocol PostPresenterProtocol: class {
    var interactor: PostInteractorInputProtocol? { get set }
    func viewDidLoad()
}

//MARK: Interactor -
protocol PostInteractorOutputProtocol: class {
    func retrievePosts(posts: Posts)
    func onError(error:Error)
    /* Interactor -> Presenter */
}

protocol PostInteractorInputProtocol: class {
    var presenter: PostInteractorOutputProtocol?  { get set }
    func requestPosts()
    /* Presenter -> Interactor */
}

//MARK: View -
protocol PostViewProtocol: class {
    var presenter: PostPresenterProtocol?  { get set }
    func show(post:Posts)
    /* Presenter -> ViewController */
}
