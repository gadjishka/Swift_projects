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
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50)) // создаем кнопку
        button.setTitle("Сбросить рекорды", for: .normal) // устанавливаем текст на кнопке
        button.backgroundColor = .systemGray // устанавливаем цвет фона кнопки
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // добавляем действие на нажатие кнопки
        view.addSubview(button) // добавляем кнопку на экран
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let color:UIColor = Settings.shared.colorChange()
        tableView.backgroundColor = color
        
    }
    
    @objc func buttonTapped() {
        Game.records.resetRecords()
        data = Game.records.recordsGame.recordsDict
        self.tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        if let item = data.enumerated().first(where: { $0.offset == indexPath.row }) {
            cell.textLabel?.text = "\(item.element.key)"
            cell.detailTextLabel?.text = String(item.element.value)
        }
        cell.backgroundColor = Settings.shared.colorChange()
        return cell
    }
    
}
