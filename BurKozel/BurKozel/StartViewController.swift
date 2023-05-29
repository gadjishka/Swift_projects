//
//  StartViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 18.04.2023.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создайте экземпляр UIColor, используя название цвета в виде строки
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let color:UIColor = Settings.shared.colorChange()
        // Установите цвет фона вашего UIViewController
        view.backgroundColor = color
        if Game.shared.currentSettings.statusGame == false{
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        }
        else{
            continueButton.isEnabled = true
            continueButton.alpha = 1
        }
    }
    
    
    @IBAction func newGameButton(_ sender: Any) {
        Game.shared.resetSettings()
    }
    
}
