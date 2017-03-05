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
        
        tipPercent.text = "\(Int(tipSlider.value.rounded()) * 5) %"
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmount.becomeFirstResponder()
        billAmount.addTarget(self, action: #selector(updateBill(_:)), for: .editingChanged)
        updateLabels()
    }
    
    func updateBill(_ billAmount: UITextField) {
        updateLabels()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billChanged(_ sender: AnyObject) {
        updateLabels()
    }
    
    func updateLabels(){
        if billAmount.text == ""{
            bill = 0.0
            tipP = 0.0
            //tipPercent.text = "\(Int(tipSlider.value.rounded()) * 5) %"
        }else{
            bill = Double(billAmount.text!)!
            tipP = Double((tipSlider.value.rounded()) * 5)
            //tipPercent.text = "\(tipP) %"
        }
        //
        //bill = 100.0
        
        tip = Double((bill * tipP)/100)
        total = Double(bill + tip)
        tipAmount.text = "$ \(tip)"
        totalAmount.text = "$ \(total)"
    }

}

