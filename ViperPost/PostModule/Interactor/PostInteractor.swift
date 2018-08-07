//
//  PostInteractor.swift
//  ViperPost
//
//  Created Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit

class PostInteractor: PostInteractorInputProtocol {
    weak var presenter: PostInteractorOutputProtocol?
    
    func requestPosts() {
        let session = URLSession.shared
        let network = NetworkManager(session: session)
        guard let url = ApiURL.postsURL() else {return}
        network.getPost(url: url) { (postResult) in
            switch postResult {
            case .success(let posts):
                self.presenter?.retrievePosts(posts: posts)
            case .failure(let error):
                self.presenter?.onError(error: error)
                break
            }
        }
    }
}
