//
//  VkAuthViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 26.09.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit
import WebKit

class VkAuthViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    let nextVC = LoginFormController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    func setup() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func loadView() {
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanWebViewCookies()
        setup()
        loadVkAuth()
    }
    
    func cleanWebViewCookies() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default()
            .fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) {
                records in records.forEach {
                    record in WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                }
            }
    }
    
    func loadVkAuth() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7609987"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        guard let url = urlComponents.url else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
        .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        if let token = params["access_token"] {
            
            debugPrint("Access token: \(token)")
            Session.instance.token = token
            
            // MARK: - Go to next VC
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let nextVC = storyBoard.instantiateViewController(withIdentifier: "TabBarID") as? UITabBarController {
                nextVC.modalTransitionStyle = .crossDissolve
                nextVC.modalPresentationStyle = .overCurrentContext
                
                present(nextVC, animated: true, completion: nil)
            }
            
        } else {

            let message = "Неправильный логин или пароль"
            
            let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            })
            self.present(alert, animated: true)
        }
    
        decisionHandler(.cancel)
    }
    
}
