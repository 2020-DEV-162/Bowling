//
//  FrameData.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

struct FrameData {
    // MARK: - Properties
    
    let ballThrows: [BallThrowsData]
    let type: FrameType

    // MARK: - Public API's
    
    var baseScore: Int {
        var result = 0
        for ballThrow in ballThrows {
            result += ballThrow.fallenPins
        }
        return result
    }
    
    var endScore: Int = 0
}
