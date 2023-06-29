//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        quizBrain.getScore()
        
        quizBrain.disableButtonsHandler = { [weak self] in
            DispatchQueue.main.async {
                self?.falseButton.isEnabled = false
                self?.falseButton.setTitleColor(UIColor.lightGray, for: .normal)
                self?.trueButton.isEnabled = false
                self?.trueButton.setTitleColor(UIColor.lightGray, for: .normal)
                self?.questionLabel.text = "Congrats! The quiz is complete."
            }
        }
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let checkRes = quizBrain.checkAnswer(userAnswer)
        
        if checkRes {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            sender.backgroundColor = UIColor.clear
        }
        
        quizBrain.nextQuestion()
        updateQuestion()
        
        
    }
    
    func updateQuestion() {
        progressBar.progress = quizBrain.gerProgress()
        questionLabel.text = quizBrain.getQuestion()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

