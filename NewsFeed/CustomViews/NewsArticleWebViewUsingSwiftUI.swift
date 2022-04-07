//
//  NewsArticleWebViewUsingSwiftUI.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//

import SwiftUI
import WebKit

// UIViewRepresentable protocol enables an existing UIKit View to be added to a  SwiftUI hierarchy
struct NewsArticleWebViewUsingSwiftUI: UIViewRepresentable {
    
    var myURL: String? = ""
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = URL(string: myURL ?? "") else { return }
        let myRequest = URLRequest(url: myURL)
        uiView.load(myRequest)
    }
}

struct NewsArticleWebViewUsingSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleWebViewUsingSwiftUI(myURL: "https://www.google.com")
    }
}
