//
//  SecondstepTableViewCell.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 11/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class SecondstepTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var txtcellName: UILabel!
    
    @IBOutlet weak var txtcellDOB: UILabel!
    
    @IBOutlet weak var txtcellAge: UILabel!
    
    @IBOutlet weak var txtcellRelationship: UILabel!
    
    @IBOutlet weak var btnEditm: UIButton!
   
    @IBOutlet weak var btnDeletem: UIButton!
    
    @IBAction func btnEditPressedm(_ sender: Any)
    {
        
        if((self.btnEditeclickedm) != nil)
        {
            self.btnEditeclickedm!(self)
        }
    }
    
    var btnDeletm: ((_ aCell: SecondstepTableViewCell) -> Void)? = nil
    
    var btnEditeclickedm: ((_ aCell: SecondstepTableViewCell) -> Void)? = nil

    @IBOutlet weak var lblTick: UILabel!

   
   
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        lblTick.text = "\u{E86E}"
        
        btnDeletem.layer.cornerRadius=3;
        
        btnDeletem.clipsToBounds = true;
        
        btnDeletem.layer.borderWidth=0.5;
        
        btnEditm.layer.cornerRadius=3;
        
        btnEditm.clipsToBounds = true;
        
        btnEditm.layer.borderWidth=0.5;
        
//        txtcellAge.isUserInteractionEnabled = false
//        
//        txtcellDOB.isUserInteractionEnabled = false
//        
//        txtcellName.isUserInteractionEnabled = false
//        
//        txtcellRelationship.isUserInteractionEnabled = false
        
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnDeletePressedm(_ sender: Any) {
        
        if((self.btnDeletm) != nil)
        {
            self.btnDeletm!(self)
        }
        
    }

}
