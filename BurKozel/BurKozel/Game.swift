//
//  Game.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 18.04.2023.
//

import Foundation


enum KeysUserGameDefaults{
    static let gameContinue = "gameContinue"
}

enum KeysUserRecordsDefaults{
    static let gamerecords = "gamerecords"
}

struct GameContinue:Codable{
    var statusGame: Bool
    var playersCount: Int
    var playersNames: [String]
    var pointsForGame: [String]
}

struct GameRecords:Codable{
    var recordsDict: Dictionary<String, Int>
}

class Game{
    
    static var shared = Game()
    
    private let defaultSettings = GameContinue(statusGame: false, playersCount: 4, playersNames: ["Гаджи", "Тася", "Сергей", "Наташа"], pointsForGame: ["0", "0", "0", "0"])
    
    var currentSettings: GameContinue{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserGameDefaults.gameContinue) as? Data{
                return try! PropertyListDecoder().decode(GameContinue.self, from: data)
            }
            else {
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.setValue(data, forKey: KeysUserGameDefaults.gameContinue)
                }
                return defaultSettings
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserGameDefaults.gameContinue)
            }
            
        }
    }
    
    static var records = Game()
    private let defaultRecords = GameRecords(recordsDict: [:])
    
    var recordsGame: GameRecords{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserRecordsDefaults.gamerecords) as? Data{
                do {
                    let decoder = PropertyListDecoder()
                    let gameRecords = try decoder.decode(GameRecords.self, from: data)
                    return gameRecords
                } catch let error {
                    print("Error decoding GameRecords: \(error)")
                    return defaultRecords
                }
            }
            else {
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.setValue(data, forKey: KeysUserRecordsDefaults.gamerecords)
                }
                return defaultRecords
            }
        }
        set{
            do {
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(newValue)
                UserDefaults.standard.setValue(data, forKey: KeysUserRecordsDefaults.gamerecords)
            } catch let error {
                print("Error encoding GameRecords: \(error)")
            }
        }
    }
    
    func resetSettings(){
        currentSettings = defaultSettings
    }
    
    func resetRecords(){
        recordsGame = defaultRecords
    }
    
}
