//
//  GameViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 18.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
   
    @IBOutlet var playersName: [UILabel]!
    
    @IBOutlet weak var winsName: UILabel!
    
    @IBOutlet weak var loserName: UILabel!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet var points: [UILabel]!
    
    @IBOutlet var setPoints: [UITextField]!
    
    var playerCount: Int = Settings.shared.currentSettings.players
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color:UIColor = Settings.shared.colorChange()
        view.backgroundColor = color
        
        updateGame()
        updatePlayersCount()
        updateInfoGame()
        for i in 0...(playerCount-1){
            points[i].text = Game.shared.currentSettings.pointsForGame[i]
        }
    }
    
    
    private func updateGame(){
        for i in 0...(playerCount-1){
            playersName[i].text = Game.shared.currentSettings.playersNames[i]
        }
        for i in setPoints{
            i.keyboardType = .numberPad
        }
    }
    
    private func updatePlayersCount(){
        switch playerCount{
        case 3:
            setPoints[3].text = "0"
            points[3].text = "0"
            playersName[3].isHidden = true
            points[3].isHidden = true
            setPoints[3].isHidden = true
        default:
            playersName[3].isHidden = false
            points[3].isHidden = false
            setPoints[3].isHidden = false

        }
    }
    
    private func updateInfoGame(){
        switch Game.shared.currentSettings.statusGame {
        case true:
            winsName.text = ""
            loserName.text = ""
            newGameButton.isHidden = true
        case false:
            winsName.text! += " winner"
            loserName.text! += " loser"
            newGameButton.isHidden = false
        }
    }
    
    private func exResult(){
        for i in 0...(playerCount-1){
            if Int(points[i].text!)! >= 31{
                loserName.text = playersName[i].text
                Game.shared.currentSettings.statusGame = false
                break
            }
        }
        if Game.shared.currentSettings.statusGame == false{
            var winIndex = 0
            for i in 0...(playerCount-1){
                if Int(points[i].text!)! < Int(points[winIndex].text!)!{
                    winIndex = i
                }
            }
            winsName.text = playersName[winIndex].text
            Game.records.recordsGame.recordsDict.updateValue(Int(points[winIndex].text!) ?? 0, forKey: playersName[winIndex].text!)
        }
    }
    
    private func exData(){
        guard let firstText = setPoints[0].text, let secondText = setPoints[1].text,
                      let thirdText = setPoints[2].text, let fourthText = setPoints[3].text else {return}
                
        if Game.shared.currentSettings.statusGame == false {
            showAlert(title: "Игра закончена", message: "Может начнешь заново?")
            return
        };
                
        if firstText.isEmpty || secondText.isEmpty || thirdText.isEmpty || fourthText.isEmpty {
            showAlert(title: "Не заполнено", message: "Может все заполнишь?")
            return
        }
    }
    
    @IBAction func newGame(_ sender: Any) {
        for i in 0...(Game.shared.currentSettings.playersCount-1){
            points[i].text = "0"
            Game.shared.currentSettings.pointsForGame[i] = "0"
        }
        Game.shared.currentSettings.statusGame = true
        updateInfoGame()
        setPoints[0].becomeFirstResponder()
        
    }
    
    @IBAction func countButton() {
        exData()
        for i in 0...(playerCount-1){
            let point: Int = Int(points[i].text ?? "0") ?? 0
            let setPoint: Int = Int(setPoints[i].text ?? "0") ?? 0
            points[i].text = "\(point + setPoint)"
            setPoints[i].text = ""
            Game.shared.currentSettings.pointsForGame[i] = points[i].text ?? "2"
        }
        exResult()
        updateInfoGame()
    }
}

extension GameViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        alert.view.center = self.view.center
        present(alert, animated: true)
    }
}

extension GameViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
