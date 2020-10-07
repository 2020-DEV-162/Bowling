//
//  FrameData.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

struct FrameData: Decodable {
    // MARK: - Properties
    
    let ballThrows: [BallThrowsData]
    
    // MARK: - Public API's
}
