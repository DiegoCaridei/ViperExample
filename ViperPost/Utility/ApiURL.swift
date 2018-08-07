//
//  Constant.swift
//  ViperPost
//
//  Created by Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
let baseURL = "https://jsonplaceholder.typicode.com"

class ApiURL {
    static func postsURL() -> URL? {
        return URL(string: baseURL)?
            .appendingPathComponent("posts")
    }
}
