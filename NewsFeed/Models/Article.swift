//
//  Article.swift
//  NewsFeed
//
//  Created by Nick Donaldson on 3/28/19.
//  Copyright © 2019 BetterUp. All rights reserved.
//

import Foundation

struct Article {
    var id: Int
    var title: String
    var createdAt: Date
    var source: String
    var description: String
    var favorite: Bool
    var heroImage: URL
    var link: URL
}
