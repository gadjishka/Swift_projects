//
//  GameViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 18.04.2023.
//

import UIKit

class InitPlayersViewController: UIViewController {

    
    
    
    @IBOutlet var playersNames: [UITextField]!
    
    @IBOutlet weak var playerFourLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let color:UIColor = Settings.shared.colorChange()
        view.backgroundColor = color
        
        Game.shared.currentSettings.playersCount = Settings.shared.currentSettings.players
        
        if Settings.shared.currentSettings.players == 3{
            playersNames[3].isHidden = true
            playerFourLabel.isHidden = true
        }
        else{
            playersNames[3].isHidden = false
            playerFourLabel.isHidden = false
        }
    }
    

    @IBAction func startGame(_ sender: Any) {
        var i = 0
        for name in playersNames{
            if !(name.text == nil || name.text == ""){
                Game.shared.currentSettings.playersNames[i] = name.text ?? ""
            }
            i += 1
        }
        Game.shared.currentSettings.statusGame = true
    }
    
    
    
    @IBAction func clearTextFields(_ sender: Any) {
        for tF in playersNames{
            tF.text = ""
        }
        playersNames[0].becomeFirstResponder()
    }
    
}

extension InitPlayersViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
