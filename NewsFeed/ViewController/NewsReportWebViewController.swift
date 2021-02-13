//
//  NewsReportWebViewController.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//  Copyright © 2021 BetterUp. All rights reserved.
//

import UIKit
import WebKit

class NewsReportWebViewController: UIViewController, WKUIDelegate {
    
    var strURL: String? = ""

    override func loadView() {
        super.loadView()
        setupUI()
        guard let myURL = URL(string: strURL ?? "") else { return }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    deinit {
        webView.stopLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
        
    private func setupNavBar() {
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
