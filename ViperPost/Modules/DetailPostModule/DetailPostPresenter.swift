//
//  DetailPostPresenter.swift
//  ViperPost
//
//  Created Diego.Caridei on 08/08/2018.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//


import UIKit

class DetailPostPresenter: DetailPostPresenterProtocol, DetailPostInteractorOutputProtocol {
    var post: PostElement?
    
    weak private var view: DetailPostViewProtocol?
    var interactor: DetailPostInteractorInputProtocol?
    private let router: DetailPostWireframeProtocol

    init(interface: DetailPostViewProtocol, interactor: DetailPostInteractorInputProtocol?, router: DetailPostWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        if let post = post { view?.showPostDetail(forPost: post) }
    }
}
