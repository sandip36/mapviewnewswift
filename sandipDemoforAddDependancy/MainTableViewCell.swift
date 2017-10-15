//
//  MainTableViewCell.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 10/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var txtName: UILabel!
    
    @IBOutlet weak var txCrelation: UILabel!
    @IBOutlet weak var txCAge: UILabel!
    @IBOutlet weak var txCDob: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    var btnDelet: ((_ aCell: MainTableViewCell) -> Void)? = nil
    var btnEditeclicked: ((_ aCell: MainTableViewCell) -> Void)? = nil
  
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblForEmployeeInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        btnDelete.layer.cornerRadius=3;
        
        btnDelete.clipsToBounds = true;
        
        btnDelete.layer.borderWidth=0.5;
        
        btnEdit.layer.cornerRadius=3;
        
        btnEdit.clipsToBounds = true;
        
        btnEdit.layer.borderWidth=0.5;
       
    }
    override var isSelected: Bool {
        willSet(newValue) {
            super.isSelected = newValue;
            // do your own business here...
        }
    }
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnEditPressed(_ sender: Any) {
        
        if((self.btnEditeclicked) != nil)
        {
            self.btnEditeclicked!(self)
        }

    }
   
    @IBAction func btnDeletPressed(_ sender: Any) {
        if((self.btnDelet) != nil)
        {
           self.btnDelet!(self)
        }
    }

}
