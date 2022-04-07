//
//  NewsArticleSwiftUIRowView.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//

import SwiftUI

struct NewsArticleSwiftUIRowView: View {
    
    @State var newsArticles: Article
    @State var imageName = "star"
    
    var body: some View {
        HStack(spacing: 15.0) {
            if self.newsArticles.favorite == false {
                Image(imageName)
                    .onTapGesture {
                        newsArticles.favorite = true
                        self.imageName = "star_filled"
                    }
            } else {
                Image("star_filled")
                    .onTapGesture {
                        newsArticles.favorite = false
                        self.imageName = "star"
                    }
            }
            VStack(alignment: .leading) {
                Text(newsArticles.title).font(.body).lineLimit(2)
                Text(newsArticles.description).font(.caption).foregroundColor(.secondary).lineLimit(2)
            }
            Spacer()
        }.padding(.horizontal, 20).padding(.vertical, 12)
    }
}

struct NewsArticleSwiftUIRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleSwiftUIRowView(newsArticles: Article(title: "Pranoti", description: "iOS developer SWIFTUI experiment.", favorite: false, link: ""))
    }
}
