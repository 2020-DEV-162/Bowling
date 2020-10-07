//
//  ViewController.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 07/10/2020.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var startBtn: UIButton!
    
    // MARK: - Actions
    
    @IBAction func onStartBtn(_ sender: Any) {
        guard let GameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameView") as? GameViewController else { return  }
        navigationController?.pushViewController(GameVC, animated: true)
    }
    
    // MARK: - LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

