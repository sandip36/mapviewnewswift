//
//  FourthParentTableViewCell.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 16/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class FourthParentTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblPrmium: UILabel!
    @IBOutlet weak var txtcellName: UILabel!
    
    @IBOutlet weak var txtcellDOB: UILabel!
    
    @IBOutlet weak var txtcellAge: UILabel!
    
    @IBOutlet weak var txtcellRelationship: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
               

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
