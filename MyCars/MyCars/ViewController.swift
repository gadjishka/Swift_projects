//
//  ViewController.swift
//  MyCars
//
//  Created by Ivan Akulov on 07/11/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
    var context: NSManagedObjectContext!
    
  //lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var markLabel: UILabel!
  @IBOutlet weak var modelLabel: UILabel!
  @IBOutlet weak var carImageView: UIImageView!
  @IBOutlet weak var lastTimeStartedLabel: UILabel!
  @IBOutlet weak var numberOfTripsLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var myChoiceImageView: UIImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func segmentedCtrlPressed(_ sender: UISegmentedControl) {
    
  }
  
  @IBAction func startEnginePressed(_ sender: UIButton) {
    
  }
  
  @IBAction func rateItPressed(_ sender: UIButton) {
    
  }
}

