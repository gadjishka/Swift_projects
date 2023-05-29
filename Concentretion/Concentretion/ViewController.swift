//
//  ViewController.swift
//  Concentretion
//
//  Created by Гаджи Герейакаев on 11.09.2022.
//

import UIKit



class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (ButtonCollection.count + 1) / 2)
    
    var touches: Int = 0 {
        didSet{
            TouchesLabel.text = "Touches: \(touches)"
        }
    }
    
    
    
    var emojiCollection = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
            
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in ButtonCollection.indices {
            let button = ButtonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    
    
    @IBOutlet var ButtonCollection: [UIButton]!
    @IBOutlet weak var TouchesLabel: UILabel!
    @IBAction func ButtonClick(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = ButtonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }
    
}

