//
//  GameViewModel.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

class GameViewModel {
    
    // MARK: - Properties

    var throwsData: [BallThrowsData] = []
    var stringResult: String = ""
    
    let spareValue: Int = 10
    
    // MARK: - Public API
    
    
    var score: Int {
        var result = 0
        var currentTurn = 0
        
        for _ in 1...10 {
            if(isStrike(forTurn: currentTurn)){
                result += 10 + strikeBonusValue(forTurn: currentTurn)
                currentTurn += 1
            }
            else if(isSpare(forTurn: currentTurn)){
                result += 10 + spareBonusValue(forTurn: currentTurn)
                currentTurn += 2
            }else{
                result += openValue(forTurn: currentTurn)
                currentTurn += 2
            }
        }
        
        return result
    }
    
    func throwBall(pins: Int){
        throwsData.append(BallThrowsData(fallenPins: pins))
    }
    
    func throwBallMultipleTimes(pins: Int, tries: Int){
        for _ in 1...tries {
            throwBall(pins: pins)
        }
    }
    
    func playOpenFrame(firstThrow: Int, secondThrow: Int)
    {
        throwBall(pins: firstThrow)
        throwBall(pins: secondThrow)
    }
    
    func playMultipleOpenFrames(firstThrow: Int, secondThrow: Int, frames: Int){
        for _ in 1...frames {
            throwBall(pins: firstThrow)
            throwBall(pins: secondThrow)
        }
    }
    
    func isSpare(forTurn: Int) -> Bool {
        return throwsData[forTurn].fallenPins + throwsData[forTurn + 1].fallenPins == 10 ? true : false
    }
    
    func isStrike(forTurn: Int) -> Bool {
        return throwsData[forTurn].fallenPins == 10 ? true : false
    }
    
    
    func strikeBonusValue(forTurn: Int) -> Int {
        return throwsData[forTurn+1].fallenPins + throwsData[forTurn+2].fallenPins
    }
    
    func spareBonusValue(forTurn: Int) -> Int {
        return throwsData[forTurn+2].fallenPins
    }
    
    func openValue(forTurn: Int) -> Int {
        return throwsData[forTurn].fallenPins + throwsData[forTurn+1].fallenPins
    }
    
}
