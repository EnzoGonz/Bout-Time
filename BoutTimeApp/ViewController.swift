//
//  ViewController.swift
//  BoutTimeApp
//
//  Created by Lorenzo Gonzalez on 3/5/17.
//  Copyright © 2017 W Lorenzo Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    func assignEventsToLabels(){
        oneLabel.text = orderOfEvents[generateRandomEvent()]
        twoLabel.text = orderOfEvents[generateRandomEvent()]
        threeLabel.text = orderOfEvents[generateRandomEvent()]
        fourLabel.text = orderOfEvents[generateRandomEvent()]
        
        usedIndex = []
    }//End assignEventsToLabel
    
    var timer = Timer()
    var counter = 59
    
    func countdownTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCountdown), userInfo: nil, repeats: true)
       
    }//End countdownTimer
    
    func startCountdown(){
        if counter != 0 {
            countdownLabel.text = ":\(counter)"
            counter -= 1
        } else {
            timer.invalidate()
            countdownLabel.text = "You Lose!"
            counter = 59
        }
    }//End startCountdown
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignEventsToLabels()
        countdownTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func oneDown(_ sender: UIButton) {
        let oneLabelText = oneLabel.text
        let twoLabelText = twoLabel.text
        
        twoLabel.text = oneLabelText
        oneLabel.text = twoLabelText
    }
    @IBAction func twoUp(_ sender: UIButton) {
        let oneLabelText = oneLabel.text
        let twoLabelText = twoLabel.text
        
        twoLabel.text = oneLabelText
        oneLabel.text = twoLabelText
    }
    @IBAction func twoDown(_ sender: UIButton) {
        let twoLabelText = twoLabel.text
        let threeLabelText = threeLabel.text
        
        threeLabel.text = twoLabelText
        twoLabel.text = threeLabelText
    }
    @IBAction func threeUp(_ sender: UIButton) {
        let twoLabelText = twoLabel.text
        let threeLabelText = threeLabel.text
        
        threeLabel.text = twoLabelText
        twoLabel.text = threeLabelText
    }
    @IBAction func threeDown(_ sender: UIButton) {
        let threeLabelText = threeLabel.text
        let fourLabelText = fourLabel.text
        
        fourLabel.text = threeLabelText
        threeLabel.text = fourLabelText
    }
    @IBAction func fourUp(_ sender: UIButton) {
        let threeLabelText = threeLabel.text
        let fourLabelText = fourLabel.text
        
        fourLabel.text = threeLabelText
        threeLabel.text = fourLabelText
    }
    
}

