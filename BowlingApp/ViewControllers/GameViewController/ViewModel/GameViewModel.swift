//
//  GameViewModel.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

class GameViewModel {
    
    // MARK: - Properties

    private var throwsData: [BallThrowsData] = []
    private let spareValue: Int = 10
    
    
    // MARK: - Public API
    
    var stringResult: String = "0" {
        didSet{
            stringResultDidChange?(stringResult)
        }
    }
    var stringResultDidChange: ((String) -> ())?
    
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
            playOpenFrame(firstThrow: firstThrow, secondThrow: secondThrow)
        }
    }
    
    private func isSpare(forTurn: Int) -> Bool {
        return throwsData[forTurn].fallenPins + throwsData[forTurn + 1].fallenPins == 10 ? true : false
    }
    
    private func isStrike(forTurn: Int) -> Bool {
        return throwsData[forTurn].fallenPins == 10 ? true : false
    }
    
    
    private func strikeBonusValue(forTurn: Int) -> Int {
        return throwsData[forTurn+1].fallenPins + throwsData[forTurn+2].fallenPins
    }
    
    private func spareBonusValue(forTurn: Int) -> Int {
        return throwsData[forTurn+2].fallenPins
    }
    
    private func openValue(forTurn: Int) -> Int {
        return throwsData[forTurn].fallenPins + throwsData[forTurn+1].fallenPins
    }
    
    func playGame(){
        
        initGame()
        
        let number = Int.random(in: 1..<4)
        switch number {
        case 1:
            throwBallMultipleTimes(pins: 5,tries: 21)
        case 2:
            throwBallMultipleTimes(pins: 10,tries: 12)
        case 3:
            playMultipleOpenFrames(firstThrow: 9, secondThrow: 0, frames: 10)
        default:
            throwBallMultipleTimes(pins: 0,tries: 20)
        }
        
        stringResult = "\(score) points"
    }
    
    private func initGame(){
        throwsData = []
    }
    
}
