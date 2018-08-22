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
        
    }

    
    

    @IBOutlet weak var BackButtonTapped: UIBarButtonItem!
    
}
