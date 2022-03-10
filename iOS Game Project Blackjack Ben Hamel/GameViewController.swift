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
    var playerCardTally: Int = 0;
    var houseScore: Int = 0;
    var houseCardTally: Int = 0;
    var gameIsWon = false
//    let deck: CardDeck
//    var playerCards: [PlayingCard]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hitButtonPressed(_ sender: UIButton) {
        playerCards.append(deck.drawCard()!)
        playerCardTally = tallyCards(tallyTheseCards: playerCards)
        if playerCardTally > 21 {
            print("Bust")
        }
        print("Player Tally", playerCardTally)
//        print("Player",playerCards)
//        print("house",houseCards)
//        for card in playerCards{
//            print(card.cardValue.rawValue)
//        }
//        tallyCards()
        
//
        
    }
    
    
    
    @IBAction func stayButtonPressed(_ sender: UIButton) {
//        let msg = "test"
        
//        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Close Alert", style:.destructive, handler: {(alert: UIAlertAction!) in self.resetGame()}))
//        self.present(alert, animated: true, completion: nil)
       
        print("Player Tally", playerCardTally)
        print("House Tally", houseCardTally)
    }
    
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        deck.createDeck()
        deck.shuffleDeck()
//        deck.drawCard()
        
        playerCards.append(deck.drawCard()!)
        playerCards.append(deck.drawCard()!)
        houseCards.append(deck.drawCard()!)
        houseCards.append(deck.drawCard()!)
        
 
        
        playerCardTally = tallyCards(tallyTheseCards: playerCards)
        houseCardTally = tallyCards(tallyTheseCards: houseCards)
        print("Start Game - Player Tally", playerCardTally)
        print("Start Game - House Tally", houseCardTally)
    }
    
    func tallyCards(tallyTheseCards: [PlayingCard])-> Int {
        var tally = 0;
        let cards = tallyTheseCards
        for card in cards{
            tally += card.cardValue.rawValue
        }
        
        return tally
    }
    
    
    
    func resetGame() {
        print("game reset")
        
    }
    

}
