//
//  SettingsViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 20.04.2023.
//

import UIKit

class SetViewController: UITableViewController {

    
    @IBOutlet weak var playersCountControl: UISegmentedControl!
    
    
    @IBOutlet var tableViewCells: [UITableViewCell]!
    
    
    @IBOutlet weak var backColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    
    
    @IBAction func changePlayersCount(_ sender: UISegmentedControl) {
        if let selectedSegmentTitle = sender.titleForSegment(at: sender.selectedSegmentIndex),
               let selectedSegmentValue = Int(selectedSegmentTitle) {
            Settings.shared.currentSettings.players = selectedSegmentValue
            } else {
                Settings.shared.currentSettings.players = 4
            }
    }
    
    
    @IBAction func resetSettings(_ sender: Any) {
        Settings.shared.resetSettings()
        loadSettings()
    }
    
    func loadSettings(){
        backColor.text = "\(Settings.shared.currentSettings.colorForGame)"
        playersCountControl.selectedSegmentIndex = Settings.shared.currentSettings.players - 3;
        let color:UIColor = Settings.shared.colorChange()
            // Установите цвет фона вашего UIViewController
        view.backgroundColor = color
        for cell in tableViewCells{
            cell.backgroundColor = color
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "selectColorVC":
            if let vc = segue.destination as? SelectColorViewController{
                vc.data = ["green", "blue", "white"]
            }
        default:
            break
        }
    }
}
