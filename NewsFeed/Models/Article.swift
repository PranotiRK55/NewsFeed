//
//  Article.swift
//  NewsFeed
//
//  Created by Nick Donaldson on 3/28/19.
//  Copyright © 2019 BetterUp. All rights reserved.
//

import Foundation

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable {
    var title: String
    var description: String
    var favorite: Bool
    var link: String
}
