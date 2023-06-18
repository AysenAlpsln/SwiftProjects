//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    let eggTimes = ["Soft":1, "Medium":8, "Hard":12]
    var secondPass = 0
    var totalTime = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        titleLabel.isHidden = false
        
        if let hardness = sender.currentTitle {
            totalTime = eggTimes[hardness]! * 60
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateCounter() {
        if secondPass <= totalTime {
            //print("\(timeToSecond) seconds.")
            let progressPer = Float(secondPass)/Float(totalTime)
            progressBar.progress = progressPer
            secondPass += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.player.stop()
            }
        }
    }
    

}
