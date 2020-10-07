//
//  ThrowData.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import Foundation

struct BallThrowsData: Decodable {
    
    // MARK: - Properties
    
    let fallenPins: Int
    
    var isStrike: Bool {
        return fallenPins == 10 ? true : false
    }
    
}
