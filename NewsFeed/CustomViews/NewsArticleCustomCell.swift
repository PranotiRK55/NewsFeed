//
//  NewsArticleCustomCell.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//

import UIKit
import SwiftUI

class NewsArticleCustomCell: UITableViewCell {
    
    init(article: Article) {
        super.init(style: .default, reuseIdentifier: "NewsArticleSwiftUIRowView")
        let vc = UIHostingController(rootView: NewsArticleSwiftUIRowView(newsArticles: article))
        contentView.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        vc.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        vc.view.backgroundColor = .clear
        
        accessoryType = .disclosureIndicator
        selectionStyle = .default
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
