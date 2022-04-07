//
//  Article.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
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
