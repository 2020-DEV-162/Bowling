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
    
    // MARK: - Public API
    
    
    var score: Int {
        var result = 0
        for ballThrow in throwsData {
            result += ballThrow.fallenPins
        }
        return result
    }
    
    var numberOfSections: Int {
        1
    }
    
    func processFrame(){
        for (index, ballThrow) in throwsData.enumerated(){
            
        }
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
    
    private func lockFrame(ballThrow: [BallThrowsData], ofType: FrameType){
        var frame: FrameData = FrameData(ballThrows: ballThrow, type: ofType)
    }

}
