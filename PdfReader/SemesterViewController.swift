//
//  SemesterViewController.swift
//  PdfReader
//
//  Created by Bhanu Pratap Singh Thapliyal on 09/09/18.
//  Copyright © 2018 Bhanu Pratap Singh Thapliyal. All rights reserved.
//

import UIKit

class SemesterViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
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
    

    override func viewDidLoad() {
        
        
        semester = [ ["first","second","third","fourth","fifth","sixth","seventh","eighth"],
                     ["CSE", "IT","EEE","ECE","MAE","CIVIL"] ]
        
        super.viewDidLoad()

    }


}
