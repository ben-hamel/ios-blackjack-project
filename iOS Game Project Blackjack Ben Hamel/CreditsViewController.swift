//
//  CreditsViewController.swift
//  iOS Game Project Blackjack Ben Hamel
//
//  Created by Ben Hamel on 2022-03-05.
//

import UIKit

class CreditsViewController: UIViewController {
    
    var playerName = String()

    @IBOutlet weak var labelPlayerName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Credits Screen Name:", playerName)
        // Do any additional setup after loading the view.
        labelPlayerName.text = "Player Name: " + db.state.name
    }
    


}
