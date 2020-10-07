//
//  GameViewModelTestCases.swift
//  BowlingAppTests
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import XCTest
@testable import BowlingApp

class GameViewModelTests: XCTestCase {
    
    // MARK: - Properties
    var viewModel: GameViewModel!
    
    // MARK: - Setup
    override func setUpWithError() throws {
        viewModel = GameViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testScore_MissedThrow(){
        viewModel.throwBall(pins: 0)
        XCTAssertEqual(viewModel.score , 0)
    }
    
    func testScore_FixedPinsPerThrow(){
        viewModel.throwBallMultipleTimes(pins: 4,tries: 20)
        XCTAssertEqual(viewModel.score , 80)
    }
    
    func testScore_Spare(){
        viewModel.throwBall(pins: 4) // Spare
        viewModel.throwBall(pins: 6) // == 10 pins in 2 throws
        viewModel.throwBall(pins: 3)
        viewModel.throwBallMultipleTimes(pins: 0,tries: 17)
        XCTAssertEqual(viewModel.score , 16)
    }
    
    func testScore_Strike(){
        viewModel.throwBall(pins: 10) // Strike == 10 pins in 1 throw
        viewModel.throwBall(pins: 2)
        viewModel.throwBall(pins: 7)
        viewModel.throwBallMultipleTimes(pins: 0,tries: 17)
        XCTAssertEqual(viewModel.score , 28)
    }
    
    
    
    

}
