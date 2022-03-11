//
//  GameViewController.swift
//  iOS Game Project Blackjack Ben Hamel
//
//  Created by Ben Hamel on 2022-03-05.
//

import UIKit

class GameViewController: UIViewController {
    
    
    var deck: CardDeck = CardDeck()
    var playerCards: [PlayingCard] = []
    var houseCards: [PlayingCard] = []
    var playerScore: Int = 0;
    var playerCardTally: Int = 0;
    var houseScore: Int = 0;
    var houseCardTally: Int = 0;
    var gameIsWon = false
    var playerName = String()
    var modelController: ModelController!
    
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var stayButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var labelPlayerScore: UILabel!
    @IBOutlet weak var labelHouseScore: UILabel!
    @IBOutlet weak var labelPlayerCount: UILabel!
    @IBOutlet weak var labelHouseCount: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPlayerScore.text = String(db.state.score)
        labelHouseScore.text = String(houseScore)
        labelPlayerCount.text = String(playerCardTally)
        labelHouseCount.text = String(houseCardTally)
    }
    
    
    @IBAction func hitButtonPressed(_ sender: UIButton) {
        playerCards.append(deck.drawCard()!)
        playerCardTally = tallyCards(tallyTheseCards: playerCards)
        checkWin()
//        print("Player Tally", playerCardTally)
//        labelPlayerScore.text = String(playerScore)
        
        updateScores()
//        labelHouseScore.text = String(houseScore)
    }
    
    
    
    @IBAction func stayButtonPressed(_ sender: UIButton) {
        while(gameIsWon == false)
        {
            houseCards.append(deck.drawCard()!)
            houseCardTally = tallyCards(tallyTheseCards: houseCards)
            if houseCardTally < 21 && houseCardTally >= playerCardTally{
                db.state.score -= 50
                if db.state.score < 0 {
                    db.state.score = 0
                }
                updateScores()
                gameIsWon = true
                loseMessage(loser: "Player")
            }
            
            else {
                checkWin()
            }
            
//            else if houseCardTally > 21 {
//                checkWin()
//                loseMessage(loser: "Player")
//            }
            
            
        }
    }
    
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        
        hitButton.isHidden = false
        stayButton.isHidden = false
        startButton.isHidden = true
        
        deck.createDeck()
        deck.shuffleDeck()
        //        deck.drawCard()
        
        //add card to palyers decks
        playerCards.append(deck.drawCard()!)
        playerCards.append(deck.drawCard()!)
        houseCards.append(deck.drawCard()!)
        houseCards.append(deck.drawCard()!)
        
        //Tally Card Numbers
        playerCardTally = tallyCards(tallyTheseCards: playerCards)
        houseCardTally = tallyCards(tallyTheseCards: houseCards)
        updateScores()
        
//        print("player name is:",playerName)
    }
    
    func tallyCards(tallyTheseCards: [PlayingCard])-> Int {
        var tally = 0;
        let cards = tallyTheseCards
        for card in cards{
            tally += card.cardValue.rawValue
        }
        
        return tally
    }
    
    func updateScores(){
        labelPlayerScore.text = String(db.state.score)
        labelHouseScore.text = String(houseScore)
        labelPlayerCount.text = String(playerCardTally)
        labelHouseCount.text = String(houseCardTally)
    }
    
    
    func checkWin(){
        if playerCardTally > 21 {
            var score = db.state.score
            score -= 50
            db.state.score = score
            if score < 0 {
                db.state.score = 0
            }
            updateScores()
            loseMessage(loser: "Player")
            
        }
        
        else if houseCardTally > 21 {
//            loseMessage(loser: "House")
            gameIsWon = true
            db.state.score += 50
            updateScores()
            
            loseMessage(loser: "House")
        }
    }
    
    func loseMessage(loser: String){
        
        let msg = "Bust: " + loser
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close Alert", style:.destructive, handler: {(alert: UIAlertAction!) in self.resetGame()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func bustgame(){
        let msg = "Game bust"
        
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close Alert", style:.destructive, handler: {(alert: UIAlertAction!) in self.resetGame()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func resetGame() {
//        print("game reset")
        deck = CardDeck()
        playerCards = []
        houseCards = []
//        playerScore = 0;
        playerCardTally = 0;
        houseScore = 0;
        houseCardTally = 0;
        gameIsWon = false
        
        hitButton.isHidden = true
        stayButton.isHidden = true
        startButton.isHidden = false
        updateScores()
    }
    
    
}
