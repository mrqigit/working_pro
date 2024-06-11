//
//  WKWebViewCtrl.swift
//  SwiftDemo
//
//  Created by MrQi on 2024/5/8.
//

import UIKit
import WebKit

class WKWebViewCtrl: UIViewController {

    var webView: WKWebView?
    lazy var config: WKWebViewConfiguration = lazyConfig()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView?.navigationDelegate = self
        view.addSubview(webView!)
        webView?.load(URLRequest(url: URL(string: "https://smlt.esign.cn/N0yGOLl")!))
    }
    
    func lazyConfig() -> WKWebViewConfiguration {
        let conf = WKWebViewConfiguration()
        conf.allowsInlineMediaPlayback = true
        return conf
    }

}

extension WKWebViewCtrl: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("-----didFinish----");
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("-----didCommit----");
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        print("-----didClose----");
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("-----didFail----\(error.localizedDescription)");
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
}
