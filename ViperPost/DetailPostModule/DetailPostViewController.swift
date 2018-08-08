//
//  DetailPostViewController.swift
//  ViperPost
//
//  Created Diego.Caridei on 08/08/2018.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//


import UIKit

class DetailPostViewController: UIViewController, DetailPostViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
	var presenter: DetailPostPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }

    func showPostDetail(forPost post: PostElement) {
        self.titleLabel.text = post.title
        self.bodyTextView.text = post.body
    }
}
