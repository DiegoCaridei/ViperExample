//
//  PostPresenter.swift
//  ViperPost
//
//  Created Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit

class PostPresenter: PostPresenterProtocol, PostInteractorOutputProtocol {
 
    weak private var view: PostViewProtocol?
    var interactor: PostInteractorInputProtocol?
    private let router: PostWireframeProtocol

    init(interface: PostViewProtocol, interactor: PostInteractorInputProtocol?, router: PostWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.requestPosts()
    }
    
    func retrievePosts(posts: Posts) {
        view?.show(post: posts)
    }
    
    func onError(error: Error) {
        //show error into VC
    }

}
