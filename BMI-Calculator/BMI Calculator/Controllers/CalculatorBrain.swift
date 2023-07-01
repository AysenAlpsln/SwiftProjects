//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ayşen Alpaslan on 2.07.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit


struct CalcultorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmistring = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmistring
    }
    
    func getComment() -> String {
        return bmi?.comment ?? "No Advice"
    }
    
    func changeBackground() -> UIColor {
        return bmi?.color ?? .blue
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiVal = weight/pow(height,2)
        if bmiVal < 18.5 {
            bmi = BMI(value: bmiVal, comment: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiVal < 24.9 {
            //alt sınırı kontrol etmene gerek yok çünkü else if yapısı kullanılıyor. ilk if sorgusu false döndüğü için alt sınırı kontrol etmiyoruz
            bmi = BMI(value: bmiVal, comment: "fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiVal, comment: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    
}
