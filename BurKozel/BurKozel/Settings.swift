//
//  Settings.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 25.04.2023.
//

import Foundation
import UIKit

enum KeysUserDefaults{
    static let settingsGame = "settingsGame"
}

struct SettingsGame:Codable{
    var players: Int
    var colorForGame: String
}

class Settings{
    static var shared = Settings()
    
    private let defaultSettings = SettingsGame(players: 4, colorForGame: "Gray")
    
    var currentSettings: SettingsGame{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            }
            else {
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
                }
                return defaultSettings
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
            }
            
        }
    }
    
    func resetSettings(){
        currentSettings = defaultSettings
    }
    
    func colorChange() -> UIColor{
        var color: UIColor
        switch Settings.shared.currentSettings.colorForGame{
        case "green":
            color = .systemGreen
        case "blue":
            color = .blue
        case"white":
            color = .white
        default:
            color = .systemGray
        }
        return color
    }
}
