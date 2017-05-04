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
    
    @IBOutlet weak var gameOverCheckScoreButton: UIButton!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    func assignEventsToLabels(){
        oneLabel.text = orderOfEvents[generateRandomEvent()]
        twoLabel.text = orderOfEvents[generateRandomEvent()]
        threeLabel.text = orderOfEvents[generateRandomEvent()]
        fourLabel.text = orderOfEvents[generateRandomEvent()]
        
        shakeToCheckAnswerButtonAsLabel.isHidden = false
        
        usedIndex = []
    }//End assignEventsToLabel
    
    var timer = Timer()
    var counter = 59
    
    func countdownTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCountdown), userInfo: nil, repeats: true)
       
    }//End countdownTimer
    
    func startCountdown(){
        if counter != 0 {
            countdownLabel.text = ": \(counter)"
            counter -= 1
        } else {
            
            do{
                try isCorrectOrIncorrect()
            } catch {}// FIXME: Complete do/catch
            
        }//End if counter
    }//End startCountdown
    
    // MARK: Keeping Score
    
    var correctAnswers = 0
    var incorrectAnswers = 0
    
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignEventsToLabels()
        shakeToCheckAnswerButtonAsLabel.isEnabled = false
        gameOverCheckScoreButton.isHidden = true
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
    
    
    // MARK: Checking Answers
    
    enum NoText: Error{
        case noText
    }
    
    
    @IBOutlet weak var shakeToCheckAnswerButtonAsLabel: UIButton!
    @IBAction func shakeToCheckAnswerButton(_ sender: UIButton) {
        shakeToCheckAnswerButtonAsLabel.setTitle("Shake to check answer!", for: UIControlState.normal)
        shakeToCheckAnswerButtonAsLabel.isEnabled = false
        shakeLabel.text = "1:00"
        assignEventsToLabels()
        countdownTimer()
    }
    
    func isCorrectOrIncorrect() throws {
        
            
            guard let firstSpot = oneLabel.text, let secondSpot = twoLabel.text, let thirdSpot = threeLabel.text, let fourthSpot = fourLabel.text else {
                throw NoText.noText
            }//End guard
            
            let userDetermiendEventOrder = [firstSpot, secondSpot, thirdSpot, fourthSpot]
            
            if userDetermiendEventOrder == orderOfEvents {
                shakeLabel.text = "Correct!"
                correctAnswers += 1
            } else {
                shakeLabel.text = "Incorrect!"
                incorrectAnswers += 1
            }//End if
        
            shakeToCheckAnswerButtonAsLabel.isEnabled = true
            shakeToCheckAnswerButtonAsLabel.setTitle("NEXT ->", for: UIControlState.normal)// FIXME: shakeToCheckAnswer make unhidden when start next round
            timer.invalidate()
            counter = 59
        
        
        if isRoundOver() == true{
            //present new screen displaying score
        }//End if
            
        
    }//End isCorrectOrIncorrect
    
    
    
    @IBOutlet weak var shakeLabel: UILabel!
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            do {
                try isCorrectOrIncorrect()
            } catch {}// FIXME: Complete do/ catch
        }//End If gesture
    }
    
    func isRoundOver() -> Bool{
        if correctAnswers + incorrectAnswers == 6 {
            shakeToCheckAnswerButtonAsLabel.isHidden = true
            gameOverCheckScoreButton.isHidden = false
            
            // FIXME: Play again button must reset correct and incorrect answers to 0
            
            return true
        } else {
            return false
        }//End if
    }//End isRoundOver
    
    
    
    
}//End ViewController









