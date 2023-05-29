//
//  ViewController.swift
//  MyDaysApp
//
//  Created by Гаджи Герейакаев on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var InfoLabel: UILabel!
    private var numberOfDays = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // resultButton.layer.cornerRadius = 12
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
            let range = sender.date..<Date.now
            numberOfDays = range.formatted(.components(style: .wide, fields: [.day]))
        }

    @IBAction func resultButtonTapped() {
        InfoLabel.text = "Ты наслаждаешься жизнью уже \(numberOfDays)"
        
    }
    
}

