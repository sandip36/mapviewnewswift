//
//  StepSecondViewController.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 11/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

var VcTwo : NSMutableArray = []


class StepSecondViewController: UIViewController,UITableViewDelegate , UITableViewDataSource, UITextFieldDelegate,EditDataViewControllerDelegate

{
    
    @IBOutlet weak var hightForButtonAdddependancy: NSLayoutConstraint!
    var animateDistance = CGFloat()
    
    var arraydata : NSMutableArray = []
    
    @IBOutlet weak var txfDOB: DTTextField!
    
    @IBOutlet weak var txfName: DTTextField!
    
    @IBOutlet weak var hightForAdddependancyView: NSLayoutConstraint!
    
    @IBOutlet weak var viewForAddDependancy: UIView!
    
    @IBOutlet weak var tblviewStep: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var lblNo: UILabel!
    
    var datePicker = UIDatePicker()
    
    @IBOutlet weak var lblYes: UILabel!
    
    var timer = Timer()
    
    var tickselected :Bool = false
    
    var progress : Float = 0.0
    
    @IBOutlet weak var BgViewForStep: UIView!
    
    @IBOutlet weak var viewStepone: UIView!
    
    @IBOutlet weak var viewSecondstep: UIView!
    
    @IBOutlet weak var viewConfirm: UIView!
    
    @IBOutlet weak var viewforThirdStep: UIView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    @IBOutlet weak var lbl4: UILabel!

    @IBOutlet weak var lblForTickmark: UILabel!
    
    
    @IBOutlet weak var bgMainView: UIView!
    
    var flag = 1
    
    var indexrow = 0
    
    var relationCatogory = "Father"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);

        setupDatePicker()
        
        txfName.delegate = self
        
        
        let nc = NotificationCenter.default
        // Note that default is now a property, not a method call
        nc.addObserver(forName:Notification.Name(rawValue:"ParentNotiFication"),
                       object:nil, queue:nil,
                       using:catchNotification)

        
        bgMainView.isHidden = true
        
        tblviewStep.delegate = self
        
        self.tblviewStep.dataSource = self
        
        self.tblviewStep.tableFooterView = UIView()
        
        lblForTickmark.text = "\u{E86A}"
        
        lblForTickmark.textColor = UIColor.black
        
        tickselected = false

        
        self.tblviewStep.rowHeight = UITableViewAutomaticDimension;
        
        self.tblviewStep.estimatedRowHeight = 144.0;
        
        viewForAddDependancy.isHidden = true
        
        hightForAdddependancyView.constant = 0
        
        self.BgViewForStep.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
 
        lblNo.text = "\u{EA93}"
        
        lblYes.text = "\u{EA58}"
        
        lblNo.textColor = UIColor.blue
        
        lblYes.textColor = UIColor.black
        
        lbl1.layer.cornerRadius = lbl1.frame.width/2
        
        lbl1.layer.backgroundColor = UIColor.green.cgColor
        
        lbl1.layer.borderWidth = 2.0
        
        lbl1.layer.borderColor = UIColor.red.cgColor
        
        lbl2.layer.cornerRadius = lbl2.frame.width/2
        
        lbl2.layer.backgroundColor = UIColor.green.cgColor
        
        lbl2.layer.borderWidth = 2.0
        
        lbl2.layer.borderColor = UIColor.red.cgColor

        
        
    }
        // Do any additional setup after loading the view.
    
    
    override func viewWillAppear(_ animated: Bool)
    {
          self.title = "Enroll Parents"
       // VcTwo.removeAllObjects()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    
    
    {
        
        

        relationCatogory = "Father"
        
        self.view.layoutIfNeeded()
        
        tblviewStep.setNeedsLayout()
        
    let datacountOfArr = VcTwo.count
                print(datacountOfArr)
                
                if(datacountOfArr >= 1)
                {
                   
                
                bgMainView.isHidden = false
                
                btnAdddependant.isEnabled = true
                
                lblYes.text = "\u{EA93}"
                
                lblNo.text = "\u{EA58}"
                
                lblYes.textColor = UIColor.blue
                
                lblNo.textColor = UIColor.black
                    
                self.arraydata = (VcTwo).mutableCopy() as! NSMutableArray
                
                
                  self.tblviewStep.reloadData()
                
            }else
            {
                bgMainView.isHidden = true
                
                lblNo.textColor = UIColor.blue
                
                lblNo.text = "\u{EA93}"
                
                lblYes.text = "\u{EA58}"
                
                bgMainView.isHidden = true
                
                lblYes.textColor = UIColor.black
            }
            
      

        
        
    }
    
    
    

    
    
    
    
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.title = ""
    }
    
    func dismissPicker() {
        
        view.endEditing(true)
        
    }

    func setupDatePicker()
    {
        
        datePicker.datePickerMode = .date
        
        let components = DateComponents()
        
        let maxDate = Calendar.current.date(byAdding: components, to: Date())
        
        datePicker.maximumDate = maxDate
        
        let gregorian: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let currentDate: NSDate = NSDate()
        
        var components2 = DateComponents()
        
        components2.year = -85
        
        let minDate: NSDate = gregorian.date(byAdding: components2, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        // components2.year = -100
        
        datePicker.minimumDate = minDate as Date
        
        txfDOB.inputView = datePicker
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(ViewController.doneClick))
        
        txfDOB.inputAccessoryView = toolBar
        
    }
    
    func doneClick() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        
        txfDOB.text = dateFormatter.string(from: datePicker.date)
        
        txfDOB.resignFirstResponder()
    }
    
    func cancelClick()
    {
        txfDOB.resignFirstResponder()
    }
    
    
    func editButtonClicked()
    {
        
    }
    //    MARK:- TableView Delegate
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(arraydata.count >= 2)
        {
            
        btnAdddependant.isEnabled = false
            hightForButtonAdddependancy.constant = 0
            
        }else{
            
             btnAdddependant.isEnabled = true
            hightForButtonAdddependancy.constant = 35
        }
        return arraydata.count
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! SecondstepTableViewCell
        
        cell.txtcellName.text = (self.arraydata[indexPath.row] as! NSDictionary).value(forKey:"Name : ") as? String
        
        cell.txtcellAge.text = (self.arraydata[indexPath.row] as! NSDictionary).value(forKey:"age : ") as? String
        
        cell.txtcellDOB.text = (self.arraydata[indexPath.row] as! NSDictionary).value(forKey:"DOB : ") as? String
        
        cell.txtcellRelationship.text = (self.arraydata[indexPath.row] as! NSDictionary).value(forKey:"Relation : ") as? String
        
        

        cell.btnDeletm = {(_ aCell: SecondstepTableViewCell) -> Void in
            
            
            
            let refreshAlert = UIAlertController(title: "", message: MyConstant.deletDependantAlert, preferredStyle: UIAlertControllerStyle.alert)
            
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                
                self.arraydata.removeObject(at: indexPath.row)
                
                
                self.relodtbleview()
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.deletedAlert, preferredStyle: UIAlertControllerStyle.alert)
                
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
        

        cell.btnEditeclickedm = {(_ aCell: SecondstepTableViewCell) -> Void in
            
          
            self.tblviewStep.setEditing(false, animated: true)
            
            self.indexrow = indexPath.row
            
            print(self.indexrow)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "EditDataViewController") as! EditDataViewController
            
             VcTwo = (self.arraydata).mutableCopy() as! NSMutableArray
            
            controller.vieName = "Second"
            
            controller.dictinaryForEdit = self.arraydata[indexPath.row] as! NSMutableDictionary
            
            self.present(controller, animated: true, completion: nil)
            
            
           self.lblForTickmark.textColor = UIColor.green
            

        }
        
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableViewAutomaticDimension
    }
    
    
    
    
      func isValidData() -> Bool
    {
        
        
        
        if let text = txfDOB.text, text.isEmpty
        {
            return false
            
        }else if let name = txfName.text, name.isEmpty
        {
            
            return false
            
        }else if(!tickselected)
        {
            
            let refreshAlert = UIAlertController(title: "", message:MyConstant.agrreAlert , preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                refreshAlert .dismiss(animated: true, completion: nil)
                
                          }))
            
            
            self.present(refreshAlert, animated: true, completion: nil)
            
            
           return false
        }else
        {
            
            lblForTickmark.text = "\u{E86A}"
            
            lblForTickmark.textColor = UIColor.black
            
            tickselected = false
            
             return true
        }
        
        
    }
    
    
    
    func relodtbleview()
    {
        //let cont = arrForPassdata.count
    self.tblviewStep.reloadData()
    }
    

    
    
    

    @IBAction func btnNoPressed(_ sender: Any)
    {
        VcTwo.removeAllObjects()
        arraydata.removeAllObjects()
        tblviewStep.reloadData()
        lblNo.textColor = UIColor.blue
        
        lblNo.text = "\u{EA93}"
        
        lblYes.text = "\u{EA58}"
        
        bgMainView.isHidden = true
        
        lblYes.textColor = UIColor.black

    }
    
    
    
    @IBOutlet weak var btnNoPressed: UIButton!
    
    @IBAction func btnYespressed(_ sender: Any)
    {
        
        self.arraydata.removeAllObjects()
        
        
    self.tblviewStep.reloadData()
        
      bgMainView.isHidden = false
        
        btnAdddependant.isEnabled = true
        
        lblYes.text = "\u{EA93}"
        
        lblNo.text = "\u{EA58}"
        
        lblYes.textColor = UIColor.blue
        
        lblNo.textColor = UIColor.black
    
    }

    @IBAction func segmentViewClicked(_ sender: Any)
    {
       
        
        if (sender as AnyObject).selectedSegmentIndex == 0
        {
          
            relationCatogory = "Father"
            
            self.txfDOB.text = ""
            self.txfName.text = ""
        }
        if (sender as AnyObject).selectedSegmentIndex == 1
        {
            self.txfDOB.text = ""
            self.txfName.text = ""
            relationCatogory = "Mother"
            
        }
        if (sender as AnyObject).selectedSegmentIndex == 2
        {
            self.txfDOB.text = ""
            self.txfName.text = ""
            relationCatogory = "Father-In-Law"
          
        }
        if (sender as AnyObject).selectedSegmentIndex == 3
        {
            self.txfDOB.text = ""
            self.txfName.text = ""
            relationCatogory = "Mother-In-Law"
            
        }
    }




    @IBAction func btnSubmit(_ sender: Any)
    {
        
        
        if txfName.text?.isEmpty ?? true
        {
            txfName.showError(message: "Enter name")
            
        }
        if txfDOB.text?.isEmpty ?? true
            
        {
            
            txfDOB.showError(message: "select the birthdate")
            
        }

        self.tblviewStep.isHidden = false
        
        viewForAddDependancy.isHidden  = false
        
        hightForAdddependancyView.constant = 280
        
    
            
            self.segment.setEnabled(true, forSegmentAt: 1);
            
            self.segment.setEnabled(true, forSegmentAt: 2);
            
            if isValidData()
            {
                
                let stringA = formattedDateFromString(dateString: txfDOB.text!, withFormat: "dd-MM-yyyy")
                
                let now = Date()
                
                
                let birthday: Date = GetDateFromString(DateStr: stringA!)
                
                let calendar = Calendar.current
                
                let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
                
                let age = ageComponents.year!
           
                
                let myString = String(age) + " Yrs"
                
                
                let txtname = txfName.text
                
                let dateBirth = txfDOB.text
                
             
           
                
                let dic : NSMutableDictionary = [:]
                
                dic["Name : "] = txtname!
                
                dic["DOB : "] = dateBirth!
                
                dic["age : "] = myString
                
                dic["Relation : "] = relationCatogory
               
                dic["Premium : "] = "Rs.10,000/-"

                
                arraydata.add(dic)

                
              
                tblviewStep.reloadData()
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.depndantAddedAlert, preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    
                    refreshAlert .dismiss(animated: true, completion: nil)
                }))
                
                
                self.present(refreshAlert, animated: true, completion: nil)

                
                txfName.text = ""
                
                txfDOB.text = ""
                
                lblForTickmark.text = "\u{E86A}"
                
                tickselected = false
                
                
                lblForTickmark.textColor = UIColor.black
                

                viewForAddDependancy.isHidden = true
                
                hightForAdddependancyView.constant = 0
            }
        
      
        
        
    }
    
    @IBOutlet weak var btnNextClicked: UIButton!
    
    
    
    @IBAction func btnAdddependancyClicked(_ sender: Any) {
        
       
        
       
        if(self.arraydata.count == 0)
        {
            self.segment.setEnabled(true, forSegmentAt: 0);
            
            
            self.segment.setEnabled(true, forSegmentAt: 1);
            
             self.segment.setEnabled(true, forSegmentAt: 3);
            
            self.segment.setEnabled(true, forSegmentAt: 2);
        }else
        
        {
            
            for i in 0...self.arraydata.count-1
            {
                
                let strfordata = self.arraydata[i] as! NSDictionary
                
                
              var choose = ""
                if let relation = strfordata["Relation : "]
                {
                    choose = relation as! String
                    
                    print(relation)
                }
                
                
                
                                if(choose == "Father")
                                {
                                    self.segment.setEnabled(false, forSegmentAt: 0);
                                    self.segment.setEnabled(true, forSegmentAt: 1);
                                    self.segment.setEnabled(true, forSegmentAt: 2);
                                    self.segment.setEnabled(true, forSegmentAt: 3);
                                    self.segment.selectedSegmentIndex = 1
                
                                    relationCatogory = "Mother"
                
                                }
                
                                if(choose ==  "Mother")
                                {
                                    self.segment.setEnabled(true, forSegmentAt: 0);
                                    self.segment.setEnabled(true, forSegmentAt: 2);
                                    self.segment.setEnabled(true, forSegmentAt: 3);
                                    self.segment.setEnabled(false, forSegmentAt: 1);
                                    self.segment.selectedSegmentIndex = 2
                                    relationCatogory = "Father-In-Law"
                
                
                
                                }
                
                
                                if(choose ==  "Father-In-Law")
                                {
                                    self.segment.setEnabled(false, forSegmentAt: 2);
                                    self.segment.setEnabled(true, forSegmentAt: 1);
                                    self.segment.setEnabled(true, forSegmentAt: 0);
                                    self.segment.setEnabled(true, forSegmentAt: 3);
                                    self.segment.selectedSegmentIndex = 3
                
                                    relationCatogory = "Mother-In-Law"
                                }
                
                
                                if(choose ==  "Mother-In-Law")
                                {
                                    self.segment.setEnabled(true, forSegmentAt: 2);
                                    self.segment.setEnabled(true, forSegmentAt: 1);
                                    self.segment.setEnabled(true, forSegmentAt: 0);
                                    self.segment.setEnabled(false, forSegmentAt: 3);
                                    self.segment.selectedSegmentIndex = 2
                                    
                                    relationCatogory = "Father-In-Law"
                
                                   
                                    
                                }
            
                
                
                
                
        }//for loop
        }

        
        self.tblviewStep.isHidden = false
        
        viewForAddDependancy.isHidden  = false
        
        hightForAdddependancyView.constant = 280
        
        
    }
    
    
    @IBOutlet weak var btnAdddependant: UIButton!
    
    

    @IBAction func btnTickPreesed(_ sender: Any) {
            if( flag == 0)
            {
                
            lblForTickmark.text = "\u{E86A}"
                
            tickselected = false

        
            lblForTickmark.textColor = UIColor.black
        
            flag = 1
                
            }
            else
            {
                
            lblForTickmark.text = "\u{E86E}"
                
            tickselected = true
                
            lblForTickmark.textColor = UIColor.green
        
            flag = 0
        
            }

        
        
        
        
        
    }
    @IBAction func backbtnPressed(_ sender: Any)
    
    {
        
         VcTwo = arraydata
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNextClicked(_ sender: Any)
    {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ThirdStepViewController") as! ThirdStepViewController
        
        VcTwo = (arraydata).mutableCopy() as! NSMutableArray
      
        
           UserDefaults.standard.set(arraydata , forKey: "DataParent")
        
     self.navigationController?.pushViewController(nextViewController, animated:true)

        
        
    }
    
    
    func catchNotification(notification:Notification) -> Void {
        print("Catch notification")
        
        
        let dict = notification.object as! NSDictionary
        print(dict)
        
        VcTwo = arraydata
        
        print(indexrow)
        self.arraydata.replaceObject(at: self.indexrow, with: dict)
        print(arraydata)
        self.tblviewStep.reloadData()
        indexrow = 0
        
    
    }
    
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let textFieldRect : CGRect = self.view.window!.convert(textField.bounds, from: textField)
        let viewRect : CGRect = self.view.window!.convert(self.view.bounds, from: self.view)
        
        let midline : CGFloat = textFieldRect.origin.y + 0.5 * textFieldRect.size.height
        let numerator : CGFloat = midline - viewRect.origin.y - MoveKeyboard.MINIMUM_SCROLL_FRACTION * viewRect.size.height
        let denominator : CGFloat = (MoveKeyboard.MAXIMUM_SCROLL_FRACTION - MoveKeyboard.MINIMUM_SCROLL_FRACTION) * viewRect.size.height
        
        var heightFraction : CGFloat = numerator / denominator
        
        if heightFraction  > 1.0 {
            heightFraction = 1.0
        }
        
        let orientation : UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        if (orientation == UIInterfaceOrientation.portrait || orientation == UIInterfaceOrientation.portraitUpsideDown) {
            animateDistance = floor(MoveKeyboard.PORTRAIT_KEYBOARD_HEIGHT * heightFraction)
        } else {
            animateDistance = floor(MoveKeyboard.LANDSCAPE_KEYBOARD_HEIGHT * heightFraction)
        }
        
        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y -= animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(TimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if !string.isEmpty
        {
            if(textField == txfName)
            {
                
                let alfa = NSCharacterSet.letters
                var characterSet = alfa
                characterSet.insert(charactersIn: "  .")
                let invalidChars = characterSet.inverted
                let newString = string.trimmingCharacters(in: invalidChars)
                if  newString.isEmpty
                {
                    return false
                } else
                {
                    
                    return true
                }
                
            }
        }
        
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y += animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(TimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        
        return textField.resignFirstResponder()
        
    }
    
    func sendText(text: NSString) {
        print(text)
    }

    

}
