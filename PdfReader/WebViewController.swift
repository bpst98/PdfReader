//
//  WebViewController.swift
//  PdfReader
//
//  Created by Bhanu Pratap Singh Thapliyal on 22/08/18.
//  Copyright © 2018 Bhanu Pratap Singh Thapliyal. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController , UIWebViewDelegate {
    
    @IBOutlet weak var PDFView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PDFView.delegate = self
        
        let url = URL(string: "https://www.webtoons.com/en/challenge/fate/awakening/viewer?title_no=203697&episode_no=1&webtoonType=CHALLENGE")
        let request = URLRequest(url: url!)
        PDFView.loadRequest(request)
        
    }

    
    

    @IBOutlet weak var BackButtonTapped: UIBarButtonItem!
    
}
