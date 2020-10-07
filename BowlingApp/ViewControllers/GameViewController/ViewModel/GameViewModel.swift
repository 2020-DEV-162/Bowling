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
    
    // MARK: - Public API
    
    var score: Int {
        var result = 0
        
        for (index, ballThrow) in throwsData.enumerated(){
            result += ballThrow.fallenPins
            
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
}
