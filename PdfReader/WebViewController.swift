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
        
        self.tabBarController?.tabBar.layer.zPosition = -1
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        PDFView.delegate = self
  
        
        
        let url = URL(string: self.urlString)
        let request = URLRequest(url: url!)
        PDFView.loadRequest(request)
    }
    
    

    @IBOutlet weak var BackButtonTapped: UIBarButtonItem!
    
    @IBAction func BackButton(_ sender: Any) {
        self.tabBarController?.tabBar.layer.zPosition = 0
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func downloadProgress(){
        
        //download progress animation
        
        let downLoadProgressAnimation = CAShapeLayer()
        downLoadProgressAnimation.strokeColor = UIColor.purple.cgColor
        downLoadProgressAnimation.fillColor = UIColor.clear.cgColor
        downLoadProgressAnimation.lineWidth = 10
        downLoadProgressAnimation.strokeEnd = 0
        downLoadProgressAnimation.lineCap = kCALineCapRound
        
        view.layer.addSublayer(downLoadProgressAnimation)
        
        let circularPath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: 0.25*CGFloat.pi, endAngle: 2*CGFloat.pi, clockwise: true)
        
        downLoadProgressAnimation.path = circularPath.cgPath
        
        
        //download progress animation
    }
}





