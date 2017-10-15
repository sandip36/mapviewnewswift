//
//  ViewController.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 10/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

var arrForViewOneGlobal :  NSMutableArray = []



class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var employeedetais: UILabel!
    
    var arr : NSMutableArray = []
    
     var checkingMaleOrFemale = ""
    var texfildName = ""
    
    var texttDob = ""
    
    var timer = Timer()
    
    var animateDistance = CGFloat()
    
    var progress : Float = 0.0
    
    @IBOutlet weak var hightForButtonAdddependancy: NSLayoutConstraint!
    
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
    
    
    
    @IBOutlet weak var btnAddDependancy: UIButton!
    
    var datePicker = UIDatePicker()
    
    @IBOutlet weak var bgViewForAdddependant: UIView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var txfName: DTTextField!
    
    @IBOutlet weak var txfDoB: DTTextField!
    
  
    @IBOutlet weak var hightOFbgViewDependant: NSLayoutConstraint!
    
    @IBOutlet weak var tblviewHight: NSLayoutConstraint!
    
    @IBOutlet weak var tblviewForView: UITableView!
    
   // var arrForPassdata : NSMutableArray = []
   
    @IBOutlet weak var btnsubmit: UIButton!
    
    
    
    
    var indexrow = -1
    
    var relationCatogory = "Male"
    
    //  MARK:- view Delegate
    
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.title = "Self & Dependant Details"
        
        
    }

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
      
        let nc = NotificationCenter.default // Note that default is now a property, not a method call
        nc.addObserver(forName:Notification.Name(rawValue:"MyNotification"),
                       object:nil, queue:nil,
                       using:catchNotification)
        btnAddDependancy.backgroundColor = UIColor(r: 48, g: 79, b: 254)
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.targetMethod), userInfo: nil, repeats: true)
        

        self.BgViewForStep.backgroundColor = UIColor(r: 61, g: 91, b: 151)

        
        employeedetais.text = "Name : xyz \nDOB : 19-January-1991 \nAge : 26 Yrs \nBase Sum Insured : \u{20B9} 300000 /- \nEmployee Id : 1005\nGender : Male"
       
        
        let gender = "Male"
        

        if(gender == "Male")
        {
            checkingMaleOrFemale = "Wife"
            
        }else{
                 checkingMaleOrFemale = "Husbund"
            }
  
        
        
        setupDatePicker()
        
        self.tblviewForView.tableFooterView = UIView()

        self.tblviewForView.rowHeight = UITableViewAutomaticDimension;
        
        self.tblviewForView.estimatedRowHeight = 144.0;
        
    }

    
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        self.view.layoutIfNeeded()
        lbl1.layer.cornerRadius = lbl1.frame.width/2
        
        lbl1.layer.backgroundColor = UIColor.green.cgColor
        
        lbl1.layer.borderWidth = 2.0
        
        lbl1.layer.borderColor = UIColor.red.cgColor
        

        tblviewForView.setNeedsLayout()
        
        bgViewForAdddependant.isHidden = true
        
        hightOFbgViewDependant.constant = 0
        
    }
    
    
    
    
    
    func dismissPicker() {
        
        view.endEditing(true)
        
    }
    
    
    
    
    @objc func targetMethod()
    {
      
        progress = progress + 0.25
  
        if progress >= 0.26 {
            timer.invalidate()
                  }
        else
        {
            progressView.progress = progress
        }
    }
    
    
    
    //    MARK:- setupDatePicker Delegate

    
    func setupDatePicker() {
        
     
        txfDoB.textAlignment = .left
        txfDoB.tintColor = UIColor.clear

        datePicker.datePickerMode = .date
        
        let components = DateComponents()
        
        let maxDate = Calendar.current.date(byAdding: components, to: Date())
        
        datePicker.maximumDate = maxDate

        let gregorian: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let currentDate: NSDate = NSDate()
        
        
         var components2 = DateComponents()
        
        components2.year = -100
        let minDate: NSDate = gregorian.date(byAdding: components2, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        
        datePicker.minimumDate = minDate as Date
        
        txfDoB.inputView = datePicker
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(ViewController.doneClick))
       
        txfDoB.inputAccessoryView = toolBar
        
    }
   
    
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.title = ""
    }
    
    
    
    
    @objc func doneClick()
    {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        
      print(dateFormatter.string(from: datePicker.date))
        
       
        
        txfDoB.text = dateFormatter.string(from: datePicker.date)
        txfDoB.resignFirstResponder()
  
    }
    
    
    
    
    
    
    //MARK:- Text Field Delegate Method
    
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
    
    
    func textFieldDidEndEditing(_ textField: UITextField)
    
    {
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
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
     
        
        return true
    }
    

    
    
    //    MARK:- TableView Delegate

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(arr.count >= 3)
        {
            
           
            self.btnAddDependancy.isEnabled = false
             hightForButtonAdddependancy.constant = 0
        }
        else
        {
            self.btnAddDependancy.isEnabled = true
             hightForButtonAdddependancy.constant = 35
 
        }
            return arr.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! MainTableViewCell
  
        //cell.txtName.delegate = self
        
        cell.txtName.text = (self.arr[indexPath.row] as! NSDictionary).value(forKey:"Name : ") as? String
        cell.txCAge.text = (self.arr[indexPath.row] as! NSDictionary).value(forKey:"age : ") as? String
        cell.txCDob.text = (self.arr[indexPath.row] as! NSDictionary).value(forKey:"DOB : ") as? String
        cell.txCrelation.text = (self.arr[indexPath.row] as! NSDictionary).value(forKey:"Relation : ") as? String
        
//        cell.txtName.isUserInteractionEnabled = false
//          cell.txCDob.isUserInteractionEnabled = false
//          cell.txCAge.isUserInteractionEnabled = false
//          cell.txCrelation.isUserInteractionEnabled = false
//        
        
        
          //    MARK:- Delete button clicked
    cell.btnDelet = {(_ aCell: MainTableViewCell) -> Void in
      
      
           self.bgViewForAdddependant.isHidden = true
            
           self.hightOFbgViewDependant.constant = 0
        
            let refreshAlert = UIAlertController(title: "", message: MyConstant.deletDependantAlert, preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
              
                 self.arr.removeObject(at: indexPath.row)
                
                
                 self.tblviewForView.reloadData()
                
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.deletedAlert, preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    refreshAlert .dismiss(animated: true, completion: nil)
                    
                }))
                
                
                
                self.present(refreshAlert, animated: true, completion: nil)
                
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
                refreshAlert .dismiss(animated: true, completion: nil)
            }))
            
            self.present(refreshAlert, animated: true, completion: nil)
       
      
          
            
        }
        
        
        
        
        //    MARK:- edit button clicked

        
        cell.btnEditeclicked = {(_ aCell: MainTableViewCell) -> Void in
            
            
        self.tblviewForView.setEditing(false, animated: true)
            
            self.indexrow = indexPath.row
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "EditDataViewController") as! EditDataViewController
         controller.vieName = "First"
            controller.dictinaryForEdit = self.arr[indexPath.row] as! NSMutableDictionary
            
            self.present(controller, animated: true, completion: nil)
          

            
        }
        
        

  
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
    // return 190
       return UITableViewAutomaticDimension
    }
    func isValidData() -> Bool
    {
        if let text = txfDoB.text, text.isEmpty
        {
            return false
        }else if let name = txfName.text, name.isEmpty
        {
            return false
        }else
        {
            return true
        }
        

    }
    
    
    
    //    MARK:- Add button Action

    
    @IBAction func btnAddDependantClicked(_ sender: Any)
    {
        
        self.segment.setEnabled(true, forSegmentAt: 0);
        
        self.segment.setEnabled(true, forSegmentAt: 1);
        
        self.segment.setEnabled(true, forSegmentAt: 2);

        bgViewForAdddependant.isHidden = false
        
        hightOFbgViewDependant.constant = 220
        print(arr)
        
       if(arr.count == 0)
       {
        self.segment.selectedSegmentIndex = 0
        
        relationCatogory = checkingMaleOrFemale

        self.segment.setEnabled(true, forSegmentAt: 1);
        self.segment.setEnabled(true, forSegmentAt: 2);
        self.segment.setEnabled(true, forSegmentAt: 0);

       }else{
        var childcount = 0
        
        for i in 0...self.arr.count-1
        {
           
            let strfordata = self.arr[i] as! NSDictionary
            
            
            let key = "Relation : "
            var choose = ""
            if let relation = strfordata[key]
            {
                choose = relation as! String
                print(relation) // Hospital
            }
          
                        if(choose.contains("Son"))
                        {
                            childcount=childcount+1
                        }
                        if(choose.contains("Daughter"))
                        {
                            childcount=childcount+1
                        }
            if(choose.contains(checkingMaleOrFemale))
            {
                 self.segment.setEnabled(false, forSegmentAt: 0)
                self.segment.selectedSegmentIndex = 1;
                relationCatogory = "Son"
            }
//            }else{
//                self.segment.setEnabled(true, forSegmentAt: 0)
//                self.segment.selectedSegmentIndex = 1;
//                relationCatogory = "Son"
//            }
            
            
        }
        
        print("the count of chilf \(childcount)")
        if(childcount>=2)
        {
            self.segment.setEnabled(false, forSegmentAt: 1);
            
            self.segment.setEnabled(false, forSegmentAt: 2);
            self.segment.selectedSegmentIndex = 0;
            relationCatogory = checkingMaleOrFemale
            
            
        }else{
            self.segment.setEnabled(true, forSegmentAt: 1);
            
            self.segment.setEnabled(true, forSegmentAt: 2);
            
        }
        

        }

    }
    //    MARK:- segment buttion Action

    @IBAction func segmentClicked(_ sender: Any)
    {
     
        
        if (sender as AnyObject).selectedSegmentIndex == 0
    {
       
        relationCatogory = checkingMaleOrFemale
        self.txfDoB.text = ""
        self.txfName.text = ""
    
       
        }
        if (sender as AnyObject).selectedSegmentIndex == 1
        {
            self.txfDoB.text = ""
            self.txfName.text = ""
            relationCatogory = "Son"
            
        }
        if (sender as AnyObject).selectedSegmentIndex == 2
        {
            self.txfDoB.text = ""
            self.txfName.text = ""
            relationCatogory = "Daughter"
            
        }

        
    }
  //  finalcode
    
    
//    MARK:- Submit buttion Action
    @IBAction func btnSubmitClicked(_ sender: Any)
    {
        if txfName.text?.isEmpty ?? true
        {
            txfName.showError(message: "Please Enter Name")
            
        }
        if txfDoB.text?.isEmpty ?? true
            
        {
            
            txfDoB.showError(message: "Please select the birthdate")
            
        }

        print("the array conynt\(arr.count)")
        
        if(arr.count >= 3)
        {
            btnAddDependancy.isEnabled = false
            
        }else
        {
            btnAddDependancy.isEnabled = true
        }

        
       
        
            if isValidData()
            {
                
                let stringA = formattedDateFromString(dateString: txfDoB.text!, withFormat: "dd-MM-yyyy")
                
                let now = Date()
             
                let birthday: Date = GetDateFromString(DateStr: stringA!)
                
                let calendar = Calendar.current
                
                let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
               
                let age = ageComponents.year!
                
            
                let myString = String(age) + " Yrs"
                
                
                let txtname = txfName.text
                
                let dateBirth = txfDoB.text
            
              
                
                if(relationCatogory == checkingMaleOrFemale)
                {
                    
                    
                        if(relationCatogory == checkingMaleOrFemale)
                        {
                            self.segment.setEnabled(false, forSegmentAt: 0)

                            let dic : NSMutableDictionary = [:]
                            dic["Name : "] = txtname!
                            dic["DOB : "] = dateBirth!
                            dic["age : "] = myString
                            dic["Relation : "] = checkingMaleOrFemale
                    

                           arr.add(dic)
                            self.segment.selectedSegmentIndex = 1
                            
                            relationCatogory = "Son"
                          
                            self.tblviewForView.reloadData()
                        }
                    
                    let refreshAlert = UIAlertController(title: "", message: MyConstant.depndantAddedAlert, preferredStyle: UIAlertControllerStyle.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                        refreshAlert .dismiss(animated: true, completion: nil)
                        
                    }))
                    
                   
                    
                    self.present(refreshAlert, animated: true, completion: nil)
                    
                        txfName.text = ""
                        txfDoB.text = ""
                        bgViewForAdddependant.isHidden = true
                        
                        hightOFbgViewDependant.constant = 0
                  


                    
                }else{
                    
               if(age < 25)
                    {
                        
                        let dic : NSMutableDictionary = [:]
                        print(arr)
                        dic["Name : "] = txfName.text
                        dic["DOB : "] = txfDoB.text
                        dic["age : "] = myString
                        dic["Relation : "] = relationCatogory
                        
                        arr.add(dic)
                       

                        txfName.text = ""
                        txfDoB.text = ""
                    
                        tblviewForView.reloadData()
                        
                        bgViewForAdddependant.isHidden = true
                        
                        hightOFbgViewDependant.constant = 0
                        
                        
                        let refreshAlert = UIAlertController(title: "", message: MyConstant.depndantAddedAlert, preferredStyle: UIAlertControllerStyle.alert)
                        
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                            refreshAlert .dismiss(animated: true, completion: nil)
                            
                        }))
                          self.present(refreshAlert, animated: true, completion: nil)
                    }else{
                        
                        
                                let refreshAlert = UIAlertController(title: "", message: MyConstant.ChildernAgeCheckAlert, preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        
                                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                        refreshAlert .dismiss(animated: true, completion: nil)
                        
                                    }))
                        
                        
                        
                                self.present(refreshAlert, animated: true, completion: nil)
                        
                        
                        
                                }
                    

                }
                
 
            indexrow = -1
            }
            indexrow = -1
        
            
            
            
            
            
            
        
                
                
                
                
                
                
                
               
        
        
        
    }
    
    
    func catchNotification(notification:Notification) -> Void {
        print("Catch notification")
        
        
        let dict = notification.object as! NSDictionary
        print(dict)
    
        
           
        print(indexrow)
        self.arr.replaceObject(at: self.indexrow, with: dict)
            print(arr)
        self.tblviewForView.reloadData()
        indexrow = -1

    }
 
    
    
    @IBAction func BtnNextClicked(_ sender: Any)
    {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "StepSecondViewController") as! StepSecondViewController
        
       // let  dataforone = arr as! NSMutableDictionary
   
        
        UserDefaults.standard.set(arr , forKey: "DataSelf")

        arrForViewOneGlobal = arr
        
        


        print(arrForViewOneGlobal)
        
              //  let dict = notification.object as! NSDictionary
        
        
        
     //   arrForViewOneGlobal =
             self.navigationController?.pushViewController(nextViewController, animated:true)
        
    }
}















struct MoveKeyboard
{
    static let KEYBOARD_ANIMATION_DURATION : CGFloat = 0.3
    static let MINIMUM_SCROLL_FRACTION : CGFloat = 0.2;
    static let MAXIMUM_SCROLL_FRACTION : CGFloat = 0.8;
    static let PORTRAIT_KEYBOARD_HEIGHT : CGFloat = 216;
    static let LANDSCAPE_KEYBOARD_HEIGHT : CGFloat = 162;
}


extension UIColor
{
    convenience init(r : CGFloat , g : CGFloat , b: CGFloat) {
        self.init(red:r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
func GetDateFromString(DateStr: String)-> Date
{
    let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    let DateArray = DateStr.components(separatedBy: "-")
    let components = NSDateComponents()
    components.year = Int(DateArray[2])!
    components.month = Int(DateArray[1])!
    components.day = Int(DateArray[0])! + 1
    let date = calendar?.date(from: components as DateComponents)
    
    return date!
}

func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
    
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "dd-MMMM-yyyy"
    
    if let date = inputFormatter.date(from: dateString) {
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format
        
        return outputFormatter.string(from: date)
    }
    
    return nil
}
extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        // let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: mySelect)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}


