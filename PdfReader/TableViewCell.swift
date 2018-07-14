//
//  TableViewCell.swift
//  PdfReader
//
//  Created by Bhanu Pratap Singh Thapliyal on 25/06/18.
//  Copyright © 2018 Bhanu Pratap Singh Thapliyal. All rights reserved.
//

import UIKit

protocol cellDelegate {
    
    func clickDownaloadButton(cell: UITableViewCell)
    
    func clickViewButton(cell: UITableViewCell)
    
    
}

class TableViewCell: UITableViewCell {

    
    var delegate : cellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var downloadButton: UIButton!

    
    @IBAction func viewTapped(_ sender: Any) {
        print("view tapped")
        delegate?.clickViewButton(cell: self)
    }
    
    @IBAction func downloadTapped(_ sender: Any) {
        print("download tapped")
        delegate?.clickDownaloadButton(cell: self)
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
