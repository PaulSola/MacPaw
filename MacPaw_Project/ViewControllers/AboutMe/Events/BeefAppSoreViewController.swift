//
//  ShowEventViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit
import WebKit

class BeefAppSoreViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webKitView: WKWebView!
    
    
    let deviceWidth = UIScreen.main.bounds.size.width
    let deviceHeight = UIScreen.main.bounds.size.height

    var boxView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webKitView.navigationDelegate = self
        if let url = URL(string: "https://itunes.apple.com/us/app/beef/id1457689620?l=ru&ls=1&mt=8"){
            
            let request = URLRequest(url: url)
           webKitView.load(request)
            webViewStartLoading()
        } else { return }
        
        
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

    }
    
    

}
