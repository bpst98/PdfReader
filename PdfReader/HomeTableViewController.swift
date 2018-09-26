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



let pdfArray = ["https://noteshub.co.in/uploads/EVS%20Complete5925cec5b8e578.94624355.pdf","https://noteshub.co.in/uploads/2017/notes/EDC%20UNIT-12018-01-22%2006:03:32.pdf","https://noteshub.co.in/uploads/Physics%20Unit%204%205919c6cb2f7e82.11018641.pdf"]

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
        
        cell.nameLabel.text = "subject \( (indexPath.last! + 1))"
        
        cell.delegate = self
        
        return cell
    }
    
    
    
    //===============custom cell delegate methods=======================
    
    func clickViewButton(cell: UITableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        print(indexPath?.row ?? "")
        
        if let index = indexPath?.row{
            
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            let urlString = pdfArray[index]
            
            viewController.urlString = urlString
            
                self.navigationController?.pushViewController(viewController, animated: true)
        }
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
        Alamofire.download(urlString, to: destination).downloadProgress{ (Progress) in
            print(Progress.fractionCompleted*100)
        }
    }
    
    
}
    
    
 

