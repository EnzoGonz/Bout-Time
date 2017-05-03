//
//  Events.swift
//  BoutTimeApp
//
//  Created by Lorenzo Gonzalez on 3/5/17.
//  Copyright © 2017 W Lorenzo Gonzalez. All rights reserved.
//

import Foundation
import GameKit

struct Events {
    let text: String
}

let one = Events(text: "one")
let two = Events(text: "two")
let three = Events(text: "three")
let four = Events(text: "four")

let orderOfEvents: [String] = [one.text, two.text,three.text, four.text]

// MARK: Random Function

var randomIndex = 0

func randomGenerator() -> Int {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: orderOfEvents.count)
    
    return randomNumber
}//End randomGenerator



var usedIndex: [Int] = []

func canUseIndex() -> Bool {
    
    randomIndex = randomGenerator()
    
    for number in usedIndex {
        if randomIndex == number {
            return false
        }//End If
    }//End For
    
    usedIndex.append(randomIndex)
    return true
    
}//End generateOrder


func generateRandomEvent() -> Int {
    
    var shouldUseIndex = canUseIndex()
    
    while shouldUseIndex == false {
        shouldUseIndex = canUseIndex()
    }//End while
    
    return randomIndex
}//End generateRandomEvent

