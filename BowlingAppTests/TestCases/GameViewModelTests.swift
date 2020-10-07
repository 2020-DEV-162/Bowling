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

}
