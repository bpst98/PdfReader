//
//  SemesterViewController.swift
//  PdfReader
//
//  Created by Bhanu Pratap Singh Thapliyal on 09/09/18.
//  Copyright © 2018 Bhanu Pratap Singh Thapliyal. All rights reserved.
//

import UIKit

class SemesterViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    
    var semester : [[String]] = [[]]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return semester.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return semester[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return semester[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        label.text = semester[component][row]
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.addSubview(label)
        return view
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        semesterLabel.text = semester[0][pickerView.selectedRow(inComponent: 0)]
        branchLabel.text = semester[1][pickerView.selectedRow(inComponent: 1)]
        
    }
    

    override func viewDidLoad() {
        
        self.tabBarController?.tabBar.layer.zPosition = 0
        
        semester = [ ["first","second","third","fourth","fifth","sixth","seventh","eighth"],
                     ["CSE", "IT","EEE","ECE","MAE","CIVIL"] ]
        NextButton.layer.cornerRadius = 20
        super.viewDidLoad()

    }

    @IBAction func NextButtonTapped(_ sender: Any) {
        
        let nextViewController :SubjectsTableViewController =  self.storyboard?.instantiateViewController(withIdentifier: "SubjectsTableViewController") as! SubjectsTableViewController
        
        nextViewController.semester = semesterLabel.text!
        nextViewController.branch = branchLabel.text!
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
      
    
        
    }
    
    
}
