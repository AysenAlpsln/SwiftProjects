//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipValue: String!
    var stepperValue: Float!
    var resultValue: Float!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true
        
        tipValue = sender.currentTitle
    }
    
    @IBAction func stepperValueChaged(_ sender: UIStepper) {
        stepperValue = Float(sender.value)
        splitNumberLabel.text = "\(Int(stepperValue))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text!)
        let selectedTip = Float(tipValue.replacingOccurrences(of: "%", with: ""))!/100
        let tipBill = bill!*selectedTip

        resultValue = (bill!+tipBill)/stepperValue
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.result = resultValue
            resultVC.tip = tipValue
            resultVC.peopleValue = stepperValue
        }
    }
}

