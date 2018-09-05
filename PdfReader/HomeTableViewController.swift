//
//  HomeTableViewController.swift
//  PdfReader
//
//  Created by Bhanu Pratap Singh Thapliyal on 25/06/18.
//  Copyright © 2018 Bhanu Pratap Singh Thapliyal. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

let pdfArray = ["https://www.webtoons.com/en/challenge/fate/awakening/viewer?title_no=203697&episode_no=1&webtoonType=CHALLENGE","https://www.webtoons.com/en/challenge/fate/encounter/viewer?title_no=203697&episode_no=2","https://www.webtoons.com/en/challenge/fate/potential-unlocked/viewer?title_no=203697&episode_no=3"]

class HomeTableViewController: UITableViewController, cellDelegate {

    override func viewDidLoad() {
        
        self.tableView.tableFooterView = UIView()
        
        super.viewDidLoad()
        tableView.rowHeight = 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pdfArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
      
        cell.selectionStyle = .none
        
        cell.nameLabel.text = "FATE \( (indexPath.hashValue + 1))"
        
        cell.delegate = self
        
        return cell
    }
    
    
    
    //===============custom cell delegate methods=======================
    
    func clickViewButton(cell: UITableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        print(indexPath?.row ?? "")
    }
    
    func clickDownaloadButton(cell: UITableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        print(indexPath?.row ?? "" )
        
        if let index = indexPath?.row {
            downloadFile(Index: index)
        }
        
        
        
    }

    //-download tasks
    
    func downloadFile(Index: Int)
    {
        let urlString = pdfArray[Index]
        
        let destination : DownloadRequest.DownloadFileDestination = {_,_ in  let documentsURL :NSURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
            print("DOCumentURL :",documentsURL)
            let fileURL = documentsURL.appendingPathComponent("\(Index).pdf")
            print("fileURL :",fileURL ?? "")
            return (fileURL!,[.removePreviousFile, .createIntermediateDirectories])
        }
    Alamofire.download(urlString, to: destination)
        
    }
    
    
}
    
    
 

