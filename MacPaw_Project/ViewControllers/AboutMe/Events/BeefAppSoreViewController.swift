//
//  ShowEventViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit
import WebKit

class BeefAppSoreSiteViewController: UIViewController, WKNavigationDelegate {
    
    let webView = WKWebView()
    
    let url : URL?
    
    let deviceWidth = UIScreen.main.bounds.size.width
    let deviceHeight = UIScreen.main.bounds.size.height

    var boxView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.zeroConstraint(with: self.view)
        
        webView.navigationDelegate = self
        if let beefUrl = url{
            
            let request = URLRequest(url: beefUrl)
           webView.load(request)
            webViewStartLoading()
        } else { return }
        
        
    }
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func webViewStartLoading() {
        // Box config:
        boxView = UIView(frame: CGRect(x: deviceWidth/2, y: deviceHeight/2, width: 80, height: 80))
        boxView.backgroundColor = UIColor.black
        boxView.alpha = 0.9
        boxView.layer.cornerRadius = 10
        // Spin config:
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityView.frame = CGRect(x: 20, y: 12, width: 40, height: 40)
        activityView.startAnimating()
        // Text config:
        let textLabel = UILabel(frame: CGRect(x: 0, y: 50, width: 80, height: 30))
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: textLabel.font.fontName, size: 13)
        textLabel.text = "Loading..."
        // Activate:
        boxView.addSubview(activityView)
        boxView.addSubview(textLabel)
        view.addSubview(boxView)
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        boxView.removeFromSuperview()
        print("FINISHED")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print(error)
    }
    
    

}
