//
//  ViewController.swift
//  iOS Game Project Blackjack Ben Hamel
//
//  Created by Ben Hamel on 2022-03-04.
//


import UIKit

let db = ModelController()

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    //    var modelController: ModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func buttonPressedName(_ sender: UIButton) {
        db.state.name = nameField.text!
        print("sub name", db.state.name)
    }
    
    
    @IBAction func buttonPlayPressed(_ sender: UIButton) {
        print("Play Bttoon",db.state.name)
    }
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "gameVC",
//        let gameViewController = segue.destination as? GameViewController {
//            gameViewController.playerName = playerName
////            gameViewController.modelController = db
//        }
//
//        if segue.identifier == "creditsVC",
//        let creditsViewController = segue.destination as? CreditsViewController {
//            creditsViewController.playerName = playerName
//
//        }
//
//    }


}

