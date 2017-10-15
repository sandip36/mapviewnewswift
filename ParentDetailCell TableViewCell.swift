//
//  ParentDetailCell TableViewCell.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 12/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class ParentDetailCell_TableViewCell: UITableViewCell
{
    var btnDeletproperty: ((_ aCell: ParentDetailCell_TableViewCell) -> Void)? = nil
    
    var btnEditeclickedProperty: ((_ aCell: ParentDetailCell_TableViewCell) -> Void)? = nil
    

    @IBOutlet weak var btnEdit: UIButton!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var lblParentDetails: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
      
        
        btnDelete.layer.cornerRadius=3;
        
        btnDelete.clipsToBounds = true;
        
        btnDelete.layer.borderWidth=0.5;
        
        btnEdit.layer.cornerRadius=3;
        
        btnEdit.clipsToBounds = true;
        
        btnEdit.layer.borderWidth=0.5;
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        
        super.setSelected(selected, animated: animated)
        
    }

    @IBAction func btnDeletClicked(_ sender: Any)
    {
        if((self.btnDeletproperty) != nil)
        {
            
            self.btnDeletproperty!(self)
            
        }

    }
        
    @IBAction func btnAgreeClicked(_ sender: Any)
    {
        
    }
    @IBAction func btnEditClicked(_ sender: Any)
    {
        
        
        if((self.btnEditeclickedProperty) != nil)
        {
            
            self.btnEditeclickedProperty!(self)
            
        }

        
    }
    
    
    
}
