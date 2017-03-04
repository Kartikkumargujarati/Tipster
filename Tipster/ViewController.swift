//
//  ViewController.swift
//  Tipster
//
//  Created by Kartik on 3/4/17.
//  Copyright © 2017 Kartik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBAction func tipSliderMoved(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

