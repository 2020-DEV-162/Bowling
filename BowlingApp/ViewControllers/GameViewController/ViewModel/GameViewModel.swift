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
    var framesData: [FrameData] = []
    var currentScore: Int = 0
    
    let spareValue: Int = 10
    
    // MARK: - Public API
    
    
    var score: Int {
        var result = 0
        var ballThrown = 0
        
        for _ in 1...10 {
            if(isSpare(ballThrown: ballThrown)){
                result += 10 + throwsData[ballThrown + 2].fallenPins
                ballThrown += 2
            }else{
                result += throwsData[ballThrown].fallenPins + throwsData[ballThrown+1].fallenPins
                ballThrown += 2
            }
        }
        
        return result
    }
    
    var numberOfSections: Int {
        1
    }
    
    func viewModel(for index: Int) -> FrameViewModel {
        FrameViewModel(frameData: framesData[index])
    }

    var numberOfFrames: Int {
        framesData.count
    }
    
    func throwBall(pins: Int){
        throwsData.append(BallThrowsData(fallenPins: pins))
    }
    
    func throwBallMultipleTimes(pins: Int, tries: Int){
        for _ in 1...tries {
            throwBall(pins: pins)
        }
    }
    
    func isSpare(ballThrown: Int) -> Bool {
        return throwsData[ballThrown].fallenPins + throwsData[ballThrown + 1].fallenPins == 10 ? true : false
    }
    
    
    
    

}
