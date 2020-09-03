//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPlusOne = 0.1
    var numberOfPeople = 2
    var total = 0.00
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        let tipAsPercentage = sender.currentTitle!
        let percentageNumber = String(tipAsPercentage.dropLast())
        let x = Double (percentageNumber)
        tipPlusOne = (x!/100)+1
        
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
        billTextField.endEditing(true)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != nil {
            total = Double(billTextField.text!)!
            let final = total * tipPlusOne
            let eachPay = final / Double(numberOfPeople)
            let eachPayTo2Dp = String(format: "%.2f", eachPay)
            print(eachPayTo2Dp)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

