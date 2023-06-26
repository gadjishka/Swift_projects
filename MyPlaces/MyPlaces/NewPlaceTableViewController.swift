//
//  NewPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 22.06.2023.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
<<<<<<< HEAD
    
    var imageIsChange = false
    var newPlace = Place()
    
    @IBOutlet var placeImage: UIImageView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    @IBOutlet var placeName: UITextField!
    
    @IBOutlet var placeLocation: UITextField!
    
    
    @IBOutlet var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.newPlace.savePlaces()
        }
        
=======

    override func viewDidLoad() {
        super.viewDidLoad()

>>>>>>> parent of 2337033 (Add Realm Framework)
        tableView.tableFooterView = UIView()
    }

    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //
        } else {
            view.endEditing(true)
        }
    }
<<<<<<< HEAD
    
    func saveNewPlace() {
        
        var image: UIImage?
        if imageIsChange{
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
//        newPlace = Place(name: placeName.text!,
//                         location: placeLocation.text,
//                         type: placeType.text,
//                         image: image,
//                         restaurauntImage: nil)
        
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
=======

>>>>>>> parent of 2337033 (Add Realm Framework)
}

// MARK: Text Field delegate

extension NewPlaceTableViewController: UITextFieldDelegate{
    
    //Скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
