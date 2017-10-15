//
//  ThirdStepViewController.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 11/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit


var arrayforThirdGlobal : NSMutableArray = []

class ThirdStepViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var flag = 1
    
    var selectedTopUp = ""
    var  premium = ""
    var amountToCalculated = 0
    @IBOutlet weak var BGFORHIDE35: UIView!
    
    @IBOutlet weak var tbltopstartofyaxis: NSLayoutConstraint!
    var arraydatathird : NSMutableArray = []
    
    @IBOutlet weak var hightforbgbtinsubmit: NSLayoutConstraint!
    @IBOutlet weak var lblNo: UILabel!
    
    @IBOutlet weak var lbl3lack: UILabel!
    
    @IBOutlet weak var lblDynamicChange: UILabel!
    @IBOutlet weak var lbl5lack: UILabel!
    
    @IBOutlet weak var lblinsurancepremium: UILabel!
    
    @IBOutlet weak var lbltick: UILabel!
    
    @IBOutlet weak var bgMainViewOpenonyes: UIView!
    

    @IBOutlet weak var tblviewTopUp: UITableView!
    
    @IBOutlet weak var BgViewForStep: UIView!
    
    
    @IBOutlet weak var viewStepone: UIView!
    
    @IBOutlet weak var viewSecondstep: UIView!
    
    @IBOutlet weak var viewConfirm: UIView!
    
    @IBOutlet weak var viewforThirdStep: UIView!
    
    @IBOutlet weak var lblyes: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var lbl4: UILabel!
    
    @IBOutlet weak var btnSubmitClicked: UIButton!
    
     var tickselected :Bool = false
    
    var progress : Float = 0.0
    
    var timer = Timer()
    
    @IBOutlet weak var lblPremiumRS: UILabel!
    
    @IBOutlet weak var lblipremium5: UILabel!
    
    @IBOutlet weak var viewForSubmitButton: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);

       
        setupView()
        
        self.tblviewTopUp.rowHeight = UITableViewAutomaticDimension;
        
        self.tblviewTopUp.estimatedRowHeight = 144.0;
        
        
        tickselected = false
        
        self.tblviewTopUp.tableFooterView = UIView()
        
        
        lbltick.text = "\u{E86A}"
      
        
      
        
        lbl3lack.text = "\u{EA58}"
        
        lbl3lack.textColor = UIColor.black
        

        
        lbl5lack.text = "\u{EA58}"
        
        lbl5lack.textColor = UIColor.black
        
      
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.targetMethod), userInfo: nil, repeats: true)
        
    }
    func setupView()
    {
        
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
        
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        self.title = ""
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        lbl3lack.text = "\u{EA58}"
        
        lbl3lack.textColor = UIColor.black
        
        
        
        lbl5lack.text = "\u{EA58}"
        
        lbl5lack.textColor = UIColor.black
        

           }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.title = "OPT Top-up"
        
    
           print("the data should have data\(arrayforThirdGlobal)")
        
        
        let datacountOfArr = arrayforThirdGlobal.count
        print(datacountOfArr)
        
        if(datacountOfArr == 0)
        {
            
            amountToCalculated = 0
            
            UserDefaults.standard.set(amountToCalculated , forKey: "premiumCount")
            
            bgMainViewOpenonyes.isHidden = true
            
            lbltick.text = "\u{E86A}"
            
            lbltick.textColor = UIColor.black
            
            lblNo.text = "\u{EA93}"
            
            lblNo.textColor = UIColor.blue
            
             tbltopstartofyaxis.constant = 0
            lblyes.text = "\u{EA58}"
            
            lblyes.textColor = UIColor.black

        }else{
            
        
            bgMainViewOpenonyes.isHidden = false
            
            viewForSubmitButton.isHidden = true
            
            hightforbgbtinsubmit.constant = 0
            tbltopstartofyaxis.constant = -60
            
            lblyes.text = "\u{EA93}"
            
            lblyes.textColor = UIColor.blue
            
            
            lblNo.text = "\u{EA58}"
            
            lblNo.textColor = UIColor.black
            
            self.arraydatathird = (arrayforThirdGlobal ).mutableCopy() as! NSMutableArray
            
            tblviewTopUp.reloadData()
            
        }
        
               viewForSubmitButton.isHidden = true
        
        
            }

    
    

    
    @objc func targetMethod()
    {
    
        
        progress = progress + 0.25
        
        
        if progress >= 0.76
        {
            timer.invalidate()
            
            //pushLoginView()
        }
        else
        {
            progressView.progress = progress
        }
    }

    @IBAction func btnAgreeClicked(_ sender: Any)
    {
        
        if( flag == 0)
        {
            
            lbltick.text = "\u{E86A}"
            
            tickselected = false
            
            viewForSubmitButton.isHidden = false
            
            lbltick.textColor = UIColor.black
            
            flag = 1
            
        }
        else
        {
            lbltick.text = "\u{E86E}"
            
            tickselected = true
            
            lbltick.textColor = UIColor.blue
            
            flag = 0
            
        }
        

    }
    
    //    MARK:- TableView Delegate
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(arraydatathird.count >= 1)
        {
            BGFORHIDE35.isHidden = true
              }else{
            
              BGFORHIDE35.isHidden = false
         
        }
        return arraydatathird.count
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! ThirdTableViewCell
        
        cell.topupsuminsured.text = (self.arraydatathird[indexPath.row] as! NSDictionary).value(forKey:"Top-Sum-Insured : ") as? String
        
        cell.premium.text = (self.arraydatathird[indexPath.row] as! NSDictionary).value(forKey:"Premium : ") as? String
        

        cell.btnDeletm = {(_ aCell: ThirdTableViewCell) -> Void in
            
            let refreshAlert = UIAlertController(title: "", message: MyConstant.deletDependantAlert, preferredStyle: UIAlertControllerStyle.alert)
            
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                
                
                self.amountToCalculated = 0
                
                UserDefaults.standard.set(self.amountToCalculated , forKey: "premiumCount")
                
                self.arraydatathird.removeObject(at: indexPath.row)
                let defaults = UserDefaults.standard
                defaults.removeObject(forKey: "DataTopUp")
                defaults.synchronize()
                arrayforThirdGlobal.removeAllObjects()
                self.arraydatathird.removeAllObjects()
                
                

                self.tblviewTopUp.reloadData()
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.topupDeletedAlert, preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    refreshAlert .dismiss(animated: true, completion: nil)
                    
                }))
                
                
                
                self.present(refreshAlert, animated: true, completion: nil)
                
                
                
            }))
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                
                refreshAlert .dismiss(animated: true, completion: nil)
            }))
            
            self.present(refreshAlert, animated: true, completion: nil)
            
            
            
        }
        
        
        
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
    }
    
    
    
    
    
    
    @IBAction func btnNextPressed(_ sender: Any)
    {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FourthstepViewController") as! FourthstepViewController
        
         arrayforThirdGlobal = (arraydatathird ).mutableCopy() as! NSMutableArray
        
        nextViewController.topupprmium = arraydatathird
    
        self.navigationController?.pushViewController(nextViewController, animated:true)

        
    }
    
    
    
    @IBAction func btnYesPressed(_ sender: Any) {
        
        
        lblyes.textColor = UIColor.blue
        
        lblNo.textColor = UIColor.black
        
        lblyes.text = "\u{EA93}"
        
        lblNo.text = "\u{EA58}"
        

        bgMainViewOpenonyes.isHidden = false

    }
    
    
    @IBAction func btnBackpressed(_ sender: Any)
    {
        arrayforThirdGlobal = arraydatathird
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func btnNopressed(_ sender: Any) {
    
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: "DataTopUp")
        
        defaults.synchronize()
        
        
        arrayforThirdGlobal.removeAllObjects()
        
        arraydatathird.removeAllObjects()
        
        amountToCalculated = 0
        
        UserDefaults.standard.set(amountToCalculated , forKey: "premiumCount")
        
        tblviewTopUp.reloadData()
        
        lblNo.textColor = UIColor.blue
        
        lblyes.textColor = UIColor.black
        
        lblNo.text = "\u{EA93}"
        
        lblyes.text = "\u{EA58}"
        
        

        bgMainViewOpenonyes.isHidden = true

        
    }
    
    @IBAction func btn3lackClicked(_ sender: Any) {
        
        
        lbl3lack.text = "\u{EA93}"
        
        lbl3lack.textColor = UIColor.blue
        
        selectedTopUp = "Rs.300000/- "
        
        lbl5lack.text = "\u{EA58}"
        
        premium = "Rs.11000/-"
        
        
        amountToCalculated = 11000
        
        
         UserDefaults.standard.set(amountToCalculated , forKey: "premiumCount")
        lbl5lack.textColor = UIColor.black
        
        lblDynamicChange.text = "Insurance Premium of Rs.11,000/- will be deducted from your salary "
        
        
          self.btnSubmitClicked.isEnabled = true
        self.viewForSubmitButton.isHidden = false
        
        hightforbgbtinsubmit.constant = 120
         tbltopstartofyaxis.constant = 0
        
        
    }
    
    
    @IBAction func btn5lackClicked(_ sender: Any)
    {
        
        
        viewForSubmitButton.isHidden = false

        lbl5lack.text = "\u{EA93}"
        
        premium = "Rs.13000/-"
//        thirdVCPremium
        
          amountToCalculated = 13000
        lbl5lack.textColor = UIColor.blue
        
        selectedTopUp = "Rs.500000/-"
        
        lbl3lack.text = "\u{EA58}"
        
        lbl3lack.textColor = UIColor.black
     
        lblDynamicChange.text = "Insurance Premium of Rs.13,000/- will be deducted from your salary "
        
        
        UserDefaults.standard.set(amountToCalculated , forKey: "premiumCount")
        
        self.btnSubmitClicked.isEnabled = true
        
         tbltopstartofyaxis.constant = 0
        hightforbgbtinsubmit.constant = 120
        
        
    }
   
    
    @IBAction func btnSubmitClicked(_ sender: Any)
    {
        if(tickselected)
        {
           
            let dic : NSMutableDictionary = [:]
            
            dic["Top-Sum-Insured : "] = selectedTopUp
            
            dic["Premium : "] = premium
            
            arraydatathird.add(dic)
            
            tblviewTopUp.reloadData()
            
            
            let defaults = UserDefaults.standard
            
            arrayforThirdGlobal = (arraydatathird ).mutableCopy() as! NSMutableArray
            //        VcTwo.count

            defaults.set(arraydatathird, forKey: "DataTopUp")
            
            defaults.synchronize()

            viewForSubmitButton.isHidden = true
            tbltopstartofyaxis.constant = -60
            hightforbgbtinsubmit.constant = 0
            
            let refreshAlert = UIAlertController(title: "", message:MyConstant.topupSelectedAlert , preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                self.btnSubmitClicked.isEnabled = false
               
                self.tblviewTopUp.reloadData()
                
                refreshAlert .dismiss(animated: true, completion: nil)
            }))
            
            
            self.present(refreshAlert, animated: true, completion: nil)
                 }
        else{
            
            
            let refreshAlert = UIAlertController(title: "", message: MyConstant.agrreAlert, preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler:
                { (action: UIAlertAction!) in
                
              
                refreshAlert .dismiss(animated: true, completion: nil)
            }))
            
            self.present(refreshAlert, animated: true, completion: nil)
            

            
        }
        
    }
    
    
    
    
 }
