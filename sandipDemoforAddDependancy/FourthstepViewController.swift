//
//  FourthstepViewController.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 11/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class FourthstepViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var lblNotSelectedTopup: UILabel!
    @IBOutlet weak var lblNoParentAdded: UILabel!
    @IBOutlet weak var lblNoDependantAdded: UILabel!
    @IBOutlet weak var tblTopUp: UITableView!
    
    @IBOutlet weak var lblToupPremium: UILabel!
    @IBOutlet weak var lblparentPremium: UILabel!
    @IBOutlet weak var lblPremium: UILabel!
    @IBOutlet weak var tblvieHightForTbl: NSLayoutConstraint!
    var progress : Float = 0.0
    
    var timer = Timer()
    var userselectedTopup = ""
    var userextrapremium = 0
    var topupprmium : NSMutableArray = []
    var totalPremium = 0
    
    @IBOutlet weak var employeeDetails: UILabel!
    @IBOutlet weak var BgViewForStep: UIView!
    
    @IBOutlet weak var viewStepone: UIView!
    
    @IBOutlet weak var viewSecondstep: UIView!
    
    @IBOutlet weak var viewConfirm: UIView!
    
    @IBOutlet weak var viewforThirdStep: UIView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var lblinnputTopupsum: UILabel!
    @IBOutlet weak var tblparenthight: NSLayoutConstraint!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var tblParentView: UITableView!
    
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var hightoftblTopUp: NSLayoutConstraint!
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var tblconfirm: UITableView!
    
    @IBOutlet weak var lbl4: UILabel!
    
    var arrforlast :NSMutableArray = []
    
    struct Objects {
        
        var sectionName : String!
        var sectionObjects : [String]!
    }
    
  var objectArray = [Objects]()
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
    
        self.navigationItem.setHidesBackButton(true, animated:true);

        
              setupData()
        
       employeeDetails.text = "Name : xyz \nDOB : 19-January-1991 \nAge : 26 Yrs \nBase Sum Insured : Rs.300000 /- \nEmployee Id : 1005\nGender : Male "
        
    //    print(employeedetails)
        
        print(arrForViewOneGlobal)
        
      
        


        print(topupprmium)
        self.arrforlast = (arrforlast ).mutableCopy() as! NSMutableArray
//        VcTwo.count
        
        let parentPremium = VcTwo.count * 10000
        
        lblparentPremium.text = "Rs." + String(parentPremium) + "/-"
        
        let  returnValue = UserDefaults.standard.object(forKey: "premiumCount") as! Int
        
        lblToupPremium.text = "Rs." + String(returnValue) + "/-"
        
        let totlp = parentPremium + returnValue

        print("total value added \(totlp)")

        lblTotal.text = "Rs." + String(totlp) + "/-"
        
        self.tblconfirm.reloadData()
        
      
    }
    

    
    override func viewDidAppear(_ animated: Bool)
    {
        
        hightoftblTopUp.constant = self.tblTopUp.contentSize.height
        
        tblparenthight.constant = self.tblParentView.contentSize.height
        
        tblvieHightForTbl.constant = self.tblconfirm.contentSize.height
        
        self.tblTopUp.layoutIfNeeded()

        self.tblconfirm.layoutIfNeeded()
        
        self.tblParentView.layoutIfNeeded()
        
        self.view.layoutIfNeeded()
        
        
          }
    
    override func viewWillAppear(_ animated: Bool)
    {
    self.title = "Confirmation"
        
       print(VcTwo)
        
    print(arrayforThirdGlobal)
        
        var  mergedArray : NSMutableArray = []
        for i in (0..<arrayforThirdGlobal.count)
        {
            print(arrayforThirdGlobal[i])
        
            mergedArray.add(arrayforThirdGlobal[i])
        }
        
       
        
        
        
        for i in (0..<VcTwo.count)
        {
            print(VcTwo[i])
            
            mergedArray.add(VcTwo[i])
        }

        print(mergedArray)
        
        
      
        
        
        
//        for (int i=0;i<[testArray count];i++){
//            NSString *tmpObject=[NSString stringWithFormat:@"%@ %@",
//                [testArray objectAtIndex:i],
//                [testArray1 objectAtIndex:i]];
//            
//            [newArray addObject tmpObject];
//            tmpObject=nil;
//        }
        
//let mergedArray = VcTwo.addingObjects(from: arrayforThirdGlobal as! [NSMutableArray])
//print(mergedArray)
        
    timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.targetMethod), userInfo: nil, repeats: true)


    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.title = ""
    }
   
    func setupData()
    {
        
        self.tblconfirm.tableFooterView = UIView()
        
        self.tblParentView.tableFooterView = UIView()
        
        self.tblconfirm.separatorInset.left = self.tblconfirm.separatorInset.right
        
        self.tblParentView.separatorInset.left = self.tblParentView.separatorInset.right
        
        self.tblTopUp.separatorInset.left = self.tblTopUp.separatorInset.right
        
        self.BgViewForStep.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        lbl1.layer.cornerRadius = lbl1.frame.width/2
        
        lbl1.layer.backgroundColor = UIColor.green.cgColor
        
        lbl1.layer.borderWidth = 2.0
        
        lbl1.layer.borderColor = UIColor.red.cgColor
        
        lbl2.layer.cornerRadius = lbl2.frame.width/2
        
        lbl2.layer.backgroundColor = UIColor.green.cgColor
        
        lbl2.layer.borderWidth = 2.0
        
        lbl2.layer.borderColor = UIColor.red.cgColor
        
        lbl3.layer.cornerRadius = lbl1.frame.width/2
        
        lbl3.layer.backgroundColor = UIColor.green.cgColor
        
        lbl3.layer.borderWidth = 2.0
        
        lbl3.layer.borderColor = UIColor.red.cgColor
        
        lbl4.layer.cornerRadius = lbl1.frame.width/2
        
        lbl4.layer.backgroundColor = UIColor.green.cgColor
        
        lbl4.layer.borderWidth = 2.0
        
        lbl4.layer.borderColor = UIColor.red.cgColor
        
        self.tblTopUp.rowHeight = UITableViewAutomaticDimension;
        
        self.tblTopUp.estimatedRowHeight = 144.0;
        
        self.tblParentView.rowHeight = UITableViewAutomaticDimension;
        
        self.tblParentView.estimatedRowHeight = 144.0;
        
        self.tblconfirm.rowHeight = UITableViewAutomaticDimension;
        
        self.tblconfirm.estimatedRowHeight = 144.0;
        
        tblconfirm.tableFooterView = UIView()
        
        tblTopUp.tableFooterView = UIView()
        
        print(userselectedTopup)
        
        print(userextrapremium)
        
        tblconfirm.dataSource = self
        
        tblconfirm.delegate = self
        
        tblParentView.dataSource = self
        
        tblParentView.delegate = self
        
        tblTopUp.dataSource = self
        
        tblTopUp.delegate = self
      
    }
    @objc func targetMethod()
    {
       // print(progress)
        
        progress = progress + 0.25
        
        
        if progress > 1.0
        {
            timer.invalidate()
            
            //pushLoginView()
        }
        else
        {
            progressView.progress = progress
        }
    }
    
    
    //    MARK:- TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        var count:Int?
        
        if tableView == self.tblconfirm {
            count = arrForViewOneGlobal.count
            if(arrForViewOneGlobal.count >= 1)
            {
                lblNoDependantAdded.isHidden = true
            }else{
                
                 lblNoDependantAdded.isHidden = false
            }
        }
        
        if tableView == self.tblParentView {
            count =  VcTwo.count
            
            if(VcTwo.count >= 1)
            {
                lblNoParentAdded.isHidden = true
            }else{
                
                lblNoParentAdded.isHidden = false
            }
             
        }
        if tableView == self.tblTopUp {
            count = topupprmium.count
            
            if(topupprmium.count >= 1)
            {
                lblNotSelectedTopup.isHidden = true
            }else{
                
                lblNotSelectedTopup.isHidden = false
            }
            

        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == tblParentView)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellp")! as! FourthParentTableViewCell
            cell.txtcellName.text = (VcTwo[indexPath.row] as! NSDictionary).value(forKey:"Name : ") as? String
            
            cell.txtcellAge.text = (VcTwo[indexPath.row] as! NSDictionary).value(forKey:"age : ") as? String
            
            cell.txtcellDOB.text = (VcTwo[indexPath.row] as! NSDictionary).value(forKey:"DOB : ") as? String
            
            cell.txtcellRelationship.text = (VcTwo[indexPath.row] as! NSDictionary).value(forKey:"Relation : ") as? String
         
            cell.lblPrmium.text = (VcTwo[indexPath.row] as! NSDictionary).value(forKey:"Premium : ") as? String
            
            return cell
            
            
        }
    if(tableView == tblTopUp)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellT")! as! TopUpLastTableViewCell
            
            cell.topupsumInsured.text = (topupprmium[indexPath.row] as! NSDictionary).value(forKey:"Top-Sum-Insured : ") as? String
            
            cell.lblPremium.text = (topupprmium[indexPath.row] as! NSDictionary).value(forKey:"Premium : ") as? String
            
            
            return cell
            
            
        }

         else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! FourthTableViewCell
            cell.txtcellName.text = (arrForViewOneGlobal[indexPath.row] as! NSDictionary).value(forKey:"Name : ") as? String
        
            cell.txtcellAge.text = (arrForViewOneGlobal[indexPath.row] as! NSDictionary).value(forKey:"age : ") as? String
            
            cell.txtcellDOB.text = (arrForViewOneGlobal[indexPath.row] as! NSDictionary).value(forKey:"DOB : ") as? String
            
            cell.txtcellRelationship.text = (arrForViewOneGlobal[indexPath.row] as! NSDictionary).value(forKey:"Relation : ") as? String
            
            return cell
            
        }
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
    }
    

    
    @IBAction func btnConfirmPressed(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "", message: MyConstant.EnrollmentCompletedAlert, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            
            VcTwo.removeAllObjects()
            arrayforThirdGlobal.removeAllObjects()
            arrForViewOneGlobal.removeAllObjects()
            
            refreshAlert .dismiss(animated: true, completion: nil)
        }))
        
        
        self.present(refreshAlert, animated: true, completion: nil)
    }

    
    
    
   // }


    @IBAction func backButtonpressed(_ sender: Any)
    {
        
        self.navigationController?.popViewController(animated: true)
    
        
    }

}
