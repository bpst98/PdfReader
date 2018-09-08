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
    
    
    var urlString = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        PDFView.delegate = self
        
        let url = URL(string: self.urlString)
        let request = URLRequest(url: url!)
        PDFView.loadRequest(request)
    }
    
    

    @IBOutlet weak var BackButtonTapped: UIBarButtonItem!
    
}
