//
//  ViewController.swift
//  NamesCompApp
//
//  Created by Гаджи Герейакаев on 09.02.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var partnerNameTF: UITextField!
    @IBOutlet weak var yourNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourNameTF.text
        destinationVC.secondName = partnerNameTF.text
    }

    @IBAction func resultButtonTapped() {
        
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
}

