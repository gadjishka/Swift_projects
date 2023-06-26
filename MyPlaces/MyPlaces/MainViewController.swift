//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 22.06.2023.
//

import UIKit

class MainViewController: UITableViewController {

    
<<<<<<< HEAD
    //var places = Place.getPlaces()
=======
    let places = Place.getPlaces()
>>>>>>> parent of 2337033 (Add Realm Framework)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return places.count
//    }

    
<<<<<<< HEAD
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//
//        let place = places[indexPath.row]
//
//        cell.nameLabel.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//
//        if place.image == nil {
//            cell.imageOfPlace.image = UIImage(named: place.restaurauntImage!)
//        } else {
//            cell.imageOfPlace.image = place.image
//        }
//
//
//        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
//        cell.imageOfPlace.clipsToBounds = true
//
//        return cell
//    }
=======
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
>>>>>>> parent of 2337033 (Add Realm Framework)
    
     //MARK: Table View delegate
    
    
    

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
<<<<<<< HEAD
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newPlaceVC = segue.source as? NewPlaceTableViewController else {return}
        
        newPlaceVC.saveNewPlace()
        //places.append(newPlaceVC.newPlace!)
        
        tableView.reloadData()
    }
=======
    @IBAction func cancelAction(_ segue: UIStoryboardSegue){}
>>>>>>> parent of 2337033 (Add Realm Framework)

}
