//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ayşen Alpaslan on 1.07.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var comment: String?
    var background: UIColor?

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        commentLabel.text = comment
        view.backgroundColor = background
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    


}
