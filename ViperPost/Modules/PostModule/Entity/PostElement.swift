//
//  PostElement.swift
//  ViperPost
//
//  Created by Diego Caridei on 07/08/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation

typealias Posts = [PostElement]

struct PostElement: Codable {
    let userId, id: Int?
    let title, body: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userId
    }
}
