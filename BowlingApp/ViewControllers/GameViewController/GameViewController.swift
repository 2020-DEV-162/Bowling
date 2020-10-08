//
//  GameViewController.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var PlayGameBtn: UIButton!
    @IBOutlet weak var scoreResultLabel: UILabel!
    // MARK: -

    var viewModel: GameViewModel?

    // MARK: - Actions

    @IBAction func onPlayGameBtn(_ sender: Any) {
        viewModel?.playGame()
    }
    
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = GameViewModel()
        
        viewModel?.stringResultDidChange = { [weak self] (score) in
            self?.scoreResultLabel.text = score
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel = nil
    }
}
