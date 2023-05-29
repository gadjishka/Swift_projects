//
//  ResultViewController.swift
//  NamesCompApp
//
//  Created by Гаджи Герейакаев on 09.02.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var namesLabel: UILabel!
    
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
    }


}
