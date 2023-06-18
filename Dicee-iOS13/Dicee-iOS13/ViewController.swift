//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    // görsel eklemeyi #imageLiteral( kodunu otomatik yapıştırarak yapabiliriz.
    //diceImageViewOne.image = #imageLiteral(resourceName: "DiceSix")

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        /*let diceOneRandom = Int.random(in: 0...5)
        let diceTwoRandom = Int.random(in: 0...5)
        
        diceImageViewOne.image = diceArray[diceOneRandom]
        diceImageViewTwo.image = diceArray[diceTwoRandom]*/
        diceImageViewOne.image = diceArray.randomElement()
        diceImageViewTwo.image = diceArray.randomElement()

    }
    
}

