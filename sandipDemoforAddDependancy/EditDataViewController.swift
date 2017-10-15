//
//  EditDataViewController.swift
//  sandipDemoforAddDependancy
//
//  Created by Application support on 15/06/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit


protocol EditDataViewControllerDelegate {
    func sendText( text: NSString)
}

class EditDataViewController: UIViewController ,UITextFieldDelegate{

    var dictinaryForEdit  : NSMutableDictionary = [:]
    
    let delegate: EditDataViewControllerDelegate? = nil
    @IBAction func backbuttonPressed(_ sender: Any) {
        
         delegate?.sendText(text: self.txfName!.text! as NSString)
        self.dismiss(animated: true, completion: nil)
        

        
        
    }
    
    var arrayedit : NSMutableDictionary = [:]

     var datePicker = UIDatePicker()
    
     var animateDistance = CGFloat()
    
    @IBOutlet weak var lblRelation: UILabel!
    @IBOutlet weak var txfName: DTTextField!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var txfDate: DTTextField!
    
    var relationtext = ""
    
    var vieName = "First"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatePicker()
        
       // self.title = "Edit Deatails"
        
        self.txfName.delegate = self
        
        self.txfDate.delegate = self
        
       
        
        let strfordata = self.dictinaryForEdit
        
        if let relation = strfordata["Name : "]
        {
            print(relation) // Hospital
            txfName.text = relation as? String
        }
        if let relation = strfordata["DOB : "]
        {
          
            txfDate.text = relation as? String
        }
        if let relation = strfordata["age : "]
        {        }
        if let relation = strfordata["Relation : "]
        {
            print(relation) // Hospital
            
            relationtext = (relation as? String)!
        }



        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupDatePicker()
    {
  
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
   
        if(textField == txfDate)
        {
            
            
            
            
            datePicker.datePickerMode = .date
            
            let components = DateComponents()
            
            let maxDate = Calendar.current.date(byAdding: components, to: Date())
            
            datePicker.maximumDate = maxDate
            
            let gregorian: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
            
            let currentDate: NSDate = NSDate()
            
            
            
            let formatter = DateFormatter()
            // let myString = formatter.string(from: Date())
            
            
            print(txfDate.text! as String )
            
            let yourDate = formatter.date(from: txfDate.text!)
            
            //then again set the date format whhich type of output you need
            formatter.dateFormat = "dd-MMM-yyyy"
            
            
            
            
            
            
            let  datintext = txfDate.text!
            
            print(datintext)
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            
            let date = dateFormatter.date(from: datintext)
            
            datePicker.date = date!
            
            
            
            
            // let datss = txfDate.text as! Date
         //   datePicker.setDate(yourDate!, animated: false)
            
            var components2 = DateComponents()
            
            if(vieName == "Second")
            {
                components2.year = -85
            }else
            {
                components2.year = -100
            }
            
            
            let minDate: NSDate = gregorian.date(byAdding: components2, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
            
            
            datePicker.minimumDate = minDate as Date
            
            txfDate.inputView = datePicker
            
            let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(EditDataViewController.doneClick))
            
            txfDate.inputAccessoryView = toolBar
            
            
        }
        

        
        
        
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return txfName.resignFirstResponder()

    }
    @objc func doneClick()
    {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        
        print(dateFormatter.string(from: datePicker.date))
        
       
        txfDate.text = dateFormatter.string(from: datePicker.date)
        
        
        txfDate.resignFirstResponder()
    
       
        
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y += animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(TimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
        
    }
    

    @IBAction func buttonUpdateClicked(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if txfName.text?.isEmpty ?? true
        {
            txfName.showError(message: "Enter name")
            
        }
        if txfDate.text?.isEmpty ?? true
            
        {
            
            txfDate.showError(message: "Enter date of birth")
            
        }

        if isValidData() {
            
            
            
            let stringA = formattedDateFromString(dateString: txfDate.text!, withFormat: "dd-MM-yyyy")
            
            let now = Date()
            
            let birthday: Date = GetDateFromString(DateStr: stringA!)
            
            let calendar = Calendar.current
            
            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
            
            let age = ageComponents.year!
            
            
            let myString = String(age) + " Yrs"
            
            
            let txtname = txfName.text
            print(txfName)
          
            if( vieName != "Second"){
            
            if( age < 25 )
            {
              //  lblAge.text = myString
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.DependantupdateAlert, preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    
                    
                    
                    let dic : NSMutableDictionary = [:]
                    dic["Name : "] = self.txfName.text
                    dic["DOB : "] = self.txfDate.text!
                    dic["age : "] = myString
                    dic["Relation : "] = self.relationtext
                    
                    self.arrayedit.addEntries(from: dic as! [String : String])
                   // self.arrayedit.add(dic)
                    
                    print(self.arrayedit)
                    let nc = NotificationCenter.default
                    nc.post(name:Notification.Name(rawValue:"MyNotification"),
                            object: self.arrayedit,
                            userInfo: ["message":"Hello there!", "date":Date()])
                    
                    self.dismiss(animated: true, completion: nil)

                    //ParentNotiFication
                    
                    refreshAlert .dismiss(animated: true, completion: nil)
                }))
                
                
                self.present(refreshAlert, animated: true, completion: nil)
                
                txfDate.resignFirstResponder()
            }
            else
            {
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.ChildernAgeCheckAlert, preferredStyle: UIAlertControllerStyle.alert)
                
                
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    refreshAlert .dismiss(animated: true, completion: nil)
                    
                }))
                
                self.present(refreshAlert, animated: true, completion: nil)
                
            }
            }else    //parent
            {
                
                
                let refreshAlert = UIAlertController(title: "", message: MyConstant.DependantupdateAlert, preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    
                    
                    
                    let dic : NSMutableDictionary = [:]
                    dic["Name : "] = self.txfName.text
                    dic["DOB : "] = self.txfDate.text!
                    dic["age : "] = myString
                    dic["Relation : "] = self.relationtext
                    
                    self.arrayedit.addEntries(from: dic as! [String : String])
                    // self.arrayedit.add(dic)
                    
                    print(self.arrayedit)
                    let nc = NotificationCenter.default
                    nc.post(name:Notification.Name(rawValue:"ParentNotiFication"),
                            object: self.arrayedit,
                            userInfo: ["message":"sandip!", "date":Date()])
                    
                    self.dismiss(animated: true, completion: nil)
                    
                    //ParentNotiFication
                    
                    refreshAlert .dismiss(animated: true, completion: nil)
                    
                }))
                
                
                self.present(refreshAlert, animated: true, completion: nil)
                
                txfDate.resignFirstResponder()

                
                
            }

            
            
            
            

                  }
        
    }
    
    
      func isValidData() -> Bool
      {
        if let text = txfDate.text, text.isEmpty
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

}
