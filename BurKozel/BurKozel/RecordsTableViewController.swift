//
//  RecordsTableViewController.swift
//  BurKozel
//
//  Created by Гаджи Герейакаев on 04.05.2023.
//

import UIKit

class RecordsTableViewController: UITableViewController {

    var data:[String: Int] = Game.records.recordsGame.recordsDict
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
                let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
                button.setTitle("Сбросить рекорды", for: .normal)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                footerView.addSubview(button)
                
                tableView.tableFooterView = footerView
            }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let color:UIColor = Settings.shared.colorChange()
        tableView.backgroundColor = color
        
    }
    
    @objc func buttonTapped() {
        Game.records.resetRecords()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        if let item = data.enumerated().first(where: { $0.offset == indexPath.row }) {
            cell.textLabel?.text = "\(item.element.key)         \(String(item.element.value))"
            cell.detailTextLabel?.text = String(item.element.value)
        }
        cell.backgroundColor = Settings.shared.colorChange()
        return cell
    }
    
}
