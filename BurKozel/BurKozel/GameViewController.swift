//
//  GameViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 18.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
   
    @IBOutlet weak var trumpLabel: UILabel!
    
    @IBOutlet weak var dealerLabel: UILabel!
    
    @IBOutlet var playersName: [UILabel]!
    
    
    @IBOutlet var points: [UILabel]!
    
    @IBOutlet var setPoints: [UITextField]!
    
    @IBOutlet weak var mainMuneButton: UIButton!
    var playerCount: Int = Settings.shared.currentSettings.players
    
    var trumps: [String] = ["♠️", "♣️", "♥️", "♦️"]
    
    var dealerNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color:UIColor = Settings.shared.colorChange()
        view.backgroundColor = color
        
        updateGame()
        updatePlayersCount()
        for i in 0...(playerCount-1){
            points[i].text = Game.shared.currentSettings.pointsForGame[i]
        }
    }
    
    
    private func updateGame(){
        trumpLabel.text = Game.shared.currentSettings.trump
        for i in 0...(playerCount-1){
            playersName[i].text = Game.shared.currentSettings.playersNames[i]
        }
        dealerLabel.text = Game.shared.currentSettings.dealer
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
    
    
    private func exResult(){
        for i in 0...(playerCount-1){
            if Int(points[i].text!)! >= 31{
                Game.shared.currentSettings.statusGame = false
                break
            }
        }
        if Game.shared.currentSettings.statusGame == false {
            var winIndex = 0
            for i in 0...(playerCount-1){
                if Int(points[i].text!)! < Int(points[winIndex].text!)!{
                    winIndex = i
                }
            }
            Game.records.recordsGame.recordsDict.updateValue(Int(points[winIndex].text!) ?? 0, forKey: playersName[winIndex].text!)
            showAlertActionSheet(winner: playersName[winIndex].text!)
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
    
    private func newGame() {
        for i in 0...(Game.shared.currentSettings.playersCount-1){
            points[i].text = "0"
            Game.shared.currentSettings.pointsForGame[i] = "0"
        }
        Game.shared.currentSettings.statusGame = true
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
        chooseTrump()
        chooseDealer()
    }
    
    
//    @IBAction func mainMenuAction() {
//        if let viewControllers = self.navigationController?.viewControllers, viewControllers.count >= 3 {
//            let targetViewController = viewControllers[viewControllers.count - 3]
//            self.navigationController?.popToViewController(targetViewController, animated: true)
//        }
//    }
    
    private func chooseTrump(){
        Game.shared.currentSettings.trump = trumps[Int(arc4random_uniform(4))]
        trumpLabel.text = Game.shared.currentSettings.trump
    }
    private func chooseDealer(){
        dealerNumber += 1
        if dealerNumber == playerCount{
            dealerNumber = 0
        }
        Game.shared.currentSettings.dealer = Game.shared.currentSettings.playersNames[dealerNumber]
        dealerLabel.text = Game.shared.currentSettings.dealer
        print(dealerNumber, Game.shared.currentSettings.dealer ?? "")
    }
    
    private func showAlertActionSheet(winner: String){
        let alert = UIAlertController(title: "Что вы хотите сделать?", message: "Победил \(winner)", preferredStyle: .actionSheet)
        
        let newGameAction = UIAlertAction(title: "Начать новую игру", style: .default) {[weak self](_) in
            self?.newGame()
        }
        
        let showRecord = UIAlertAction(title: "Посмотреть рекорды", style: .default) { [weak self](_) in
            
            self?.performSegue(withIdentifier: "recordFromGameVC", sender: nil)
        }
        
        let menuAction = UIAlertAction(title: "Перейти в главное меню", style: .default) {[weak self] (_) in
            if let viewControllers = self?.navigationController?.viewControllers, viewControllers.count >= 3 {
                let targetViewController = viewControllers[viewControllers.count - 3]
                self?.navigationController?.popToViewController(targetViewController, animated: true)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(newGameAction)
        alert.addAction(showRecord)
        alert.addAction(menuAction)
        alert.addAction(cancelAction)
        
        
        present(alert, animated: true)
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
