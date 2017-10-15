//
//  ThirdTableViewCell.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 16/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    var btnDeletm: ((_ aCell: ThirdTableViewCell) -> Void)? = nil
    
   
    
    @IBOutlet weak var topupsuminsured: UILabel!
    
    @IBOutlet weak var premium: UILabel!
    
    @IBOutlet weak var btnDeletem: UIButton!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        btnDeletem.layer.cornerRadius=3;
        
        btnDeletem.clipsToBounds = true;
        
        btnDeletem.layer.borderWidth=0.5;

        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        
    
    }
    
    @IBAction func btnDeletePressedm(_ sender: Any) {
        
        if((self.btnDeletm) != nil)
        {
            self.btnDeletm!(self)
        }
        
    }

}
