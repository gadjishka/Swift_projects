//
//  SettingsTableViewController.swift
//  task_3
//
//  Created by Гаджи Герейакаев on 21.04.2023.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var timeGameLabel: UILabel!

    
    @IBOutlet weak var switchTimer: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSettings.timerState = sender.isOn
    }
    
    func loadSettings(){
        timeGameLabel.text = "\( Settings.shared.currentSettings.timeForGame) сек"
        switchTimer.isOn = Settings.shared.currentSettings.timerState
    }
    @IBAction func resetSettings(_ sender: Any) {
        Settings.shared.resetSettings()
        loadSettings()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "selectTimeVC":
            if let vc = segue.destination as? SelectTimeViewController{
                vc.data = Array(stride(from: 10, through: 120, by: 10))
            }
        default:
            break
        }
    
    
        
    }
    
}
