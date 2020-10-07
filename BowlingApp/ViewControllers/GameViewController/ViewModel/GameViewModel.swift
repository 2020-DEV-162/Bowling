//
//  GameViewModel.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

class GameViewModel {
    
    // MARK: - Properties

    var throwsData: [ThrowData] = []
    
    // MARK: - Public API
    
    var score: Int {
        var result = 0
        
        for (index, ballThrow) in throwsData.enumerated(){
            result += ballThrow.fallenPins
        }
        
        return result
    }
    
    func throwBall(pins: Int){
        throwsData.append(ThrowData(fallenPins: pins))
    }
}
