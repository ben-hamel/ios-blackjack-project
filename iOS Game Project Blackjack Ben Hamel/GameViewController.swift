//
//  GameViewController.swift
//  iOS Game Project Blackjack Ben Hamel
//
//  Created by Ben Hamel on 2022-03-05.
//

import UIKit

class GameViewController: UIViewController {
    
    
    let deck: CardDeck = CardDeck()
    var playerCards: [PlayingCard] = []
    var houseCards: [PlayingCard] = []
    var playerScore: Int = 0;
    var houseScore: Int = 0;
//    let deck: CardDeck
//    var playerCards: [PlayingCard]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hitButtonPressed(_ sender: UIButton) {
        playerCards.append(deck.drawCard()!)
        print("Player",playerCards)
//        print("house",houseCards)
        for card in playerCards{
            print(card.cardValue.rawValue)
        }
    }
    
    
    
    @IBAction func stayButtonPressed(_ sender: UIButton) {
        let msg = "test"
        
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close Alert", style:.destructive, handler: {(alert: UIAlertAction!) in self.resetGame()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
//        let deck = CardDeck()
//        var playerCards: [PlayingCard] = []
        
        deck.createDeck()
        deck.shuffleDeck()
//        deck.drawCard()
        
        playerCards.append(deck.drawCard()!)
        playerCards.append(deck.drawCard()!)
        houseCards.append(deck.drawCard()!)
        houseCards.append(deck.drawCard()!)
    
 
        print(playerCards)
       
        
    }
    
    
    
    func resetGame() {
        print("game reset")
        
    }
    

}
