//
//  PostViewController.swift
//  ViperPost
//
//  Created Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, PostViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    private var posts = Posts()
	var presenter: PostPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func show(post: Posts) {
        self.posts = post
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
}

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:PostVC.cellID , for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
}
