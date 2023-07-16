//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ayşen Alpaslan on 16.07.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var result: Float!
    var tip: String!
    var peopleValue: Float!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", result)
        descriptionLabel.text = "Split between \(Int(peopleValue)) people, with \(String(tip)) tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    


}
