//
//  SHWebViewController.swift
//  Flix
//
//  Created by Harold  on 11/24/17.
//  Copyright © 2017 Harold . All rights reserved.
//

import UIKit
import WebKit

class SHWebViewController: UIViewController {


    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getVideo(videoCode: "Rg6GLVUnnpM")
        // Do any additional setup after loading the view.
    }
    
    func getVideo(videoCode: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        let request = URLRequest(url: url!)
        webView.allowsLinkPreview = true
      
        webView.load(request)
    }



}
