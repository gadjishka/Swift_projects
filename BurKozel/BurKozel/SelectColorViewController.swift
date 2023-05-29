//
//  SelectColorViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 25.04.2023.
//

import UIKit

class SelectColorViewController: UIViewController {
    
    var data:[String] = []
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView?.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let color:UIColor = Settings.shared.colorChange()
        tableView.backgroundColor = color
        
    }


}

extension SelectColorViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = Settings.shared.colorChange()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        Settings.shared.currentSettings.colorForGame = data[indexPath.row]
        
        navigationController?.popViewController(animated: true)
    }
    
}
