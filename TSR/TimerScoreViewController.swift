//
//  ViewController.swift
//  TSR
//
//  Created by Jun Kyu on 2018. 7. 21..
//  Copyright © 2018년 JJworks. All rights reserved.
//

import UIKit

class TimerScoreViewController: UIViewController {

 
    var gameTime = 60
    var halfTime = 0
    var timer = Timer()
    var isTimeRunning = false
    var startStopTitle = "⏸"
    var titleLabel: UILabel?
    
    
    
    
    var scoreLeft = 0
    
    var scoreRight = 0
    
    @IBOutlet weak var timerClockLabel: UILabel!
    
    
    @IBAction func goalButtonLeft(_ sender: UIButton) {
        if isTimeRunning == true {
            scoreLeft += 1
            sender.setTitle("\(scoreLeft)", for: .normal)
        } else {
            print("You are not in the middle of game. Start your game!")
        }

    }
    
    
    @IBAction func goalButtonRight(_ sender: UIButton) {
        if isTimeRunning == true {
            scoreRight += 1
            sender.setTitle("\(scoreRight)", for: .normal)
        } else {
            print("You are not in the middle of game. Start your game!")
        }

    }
    

    
    @IBOutlet weak var startPauseButtonLabel: UIButton!
    
    @IBAction func startPauseButton(_ sender: UIButton) {
        if isTimeRunning == false {
            runTimer()
            isTimeRunning = true
            startPauseButtonLabel.setTitle(startStopTitle, for: .normal)
            startStopTitle = "▶️"
            
        } else {
            timer.invalidate()
            isTimeRunning = false
            startPauseButtonLabel.setTitle(startStopTitle, for: .normal)
            startStopTitle = "⏸"
        }
        // print("\(gameTime), \(halfTime)")
    }
    
    
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self , selector: (#selector(TimerScoreViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if gameTime < 1 {
            timer.invalidate()
            
            // make alarm
        } else {
            gameTime -= 1     //This will decrement(count down)the seconds.
            timerClockLabel.text = timeString(time: TimeInterval(gameTime)) //This will update the label.
        }
    }

    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        if minutes < 10, seconds < 10 {
            return String(format:"0\(minutes):0\(seconds)")
        } else if minutes < 10 {
            return String(format:"0\(minutes):\(seconds)")
        } else if seconds < 10 {
            return String(format:"\(minutes):0\(seconds)")
        } else {
            return String(format:"\(minutes):\(seconds)")
        }
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 */


}

