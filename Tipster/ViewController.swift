//
//  ViewController.swift
//  Tipster
//
//  Created by Kartik on 3/4/17.
//  Copyright © 2017 Kartik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bill = 0.0
    var tipP = 20.0
    var tip = 0.0
    var total = 0.0
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBAction func tipSliderMoved(_ sender: AnyObject) {
        
        //get Slider value
        tipPercent.text = "\(Int(tipSlider.value.rounded()) * 5) %"
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboard always visible
        billAmount.becomeFirstResponder()
        
        //when bill amount changed
        billAmount.addTarget(self, action: #selector(updateBill(_:)), for: .editingChanged)
        updateLabels()
    }
    
    //function executes when bill amount changed
    func updateBill(_ billAmount: UITextField) {
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //calculate and update the values, labels
    func updateLabels(){
        
        //get bill value from previous session
        let defaultVal = UserDefaults.standard
        if(defaultVal.object(forKey: "prevBill") != nil){
            let val = defaultVal.object(forKey: "prevTime")!
            if (NSDate().timeIntervalSinceReferenceDate - (val as AnyObject).timeIntervalSinceReferenceDate < 60 * 10){
                billAmount.text = defaultVal.object(forKey: "prevBill") as! String!
            }
        }
        if billAmount.text == ""{
            bill = 0.0
            tipP = 0.0
        }else{
            bill = Double(billAmount.text!)!
            tipP = Double((tipSlider.value.rounded()) * 5)
        }
        tip = Double((bill * tipP)/100)
        total = Double(bill + tip)
        tipAmount.text = "$ \(tip)"
        totalAmount.text = "$ \(total)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //save the bill and current date
        let defaultVal = UserDefaults.standard
        defaultVal.setValue(bill, forKey: "prevBill")
        defaultVal.setValue(NSDate(), forKey: "prevTime")
    }

}

