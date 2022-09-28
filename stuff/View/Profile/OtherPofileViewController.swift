//
//  OtherPofileViewController.swift
//  stuff
//
//  Created by Yigit on 22.09.2022.
//

import UIKit
import Parse
import SDWebImage
class OtherPofileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var lblNameSurname: UILabel!
    
    @IBOutlet weak var lblSuccessTradeCount: UILabel!
    
    @IBOutlet weak var lblCurrentAdvertsCount: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var chosenAdvertUsernameId = ""
    
    var firstArray = [String]()
    var secondArray = [String]()
    var cityArray = [String]()
    var townArray = [String]()
    var priceArray = [String]()
    var imageArray = [String]()
    var advertIdArray = [String]()
    var selectId = ""
    let currentUser = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        getSuccessAdvertTradeData()
        getProfileData()
      
     
        
    }
    
    
    func getProfileData(){
        let query = PFQuery(className: "Adverts")
        query.whereKey("username", equalTo: chosenAdvertUsernameId).findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.firstArray.removeAll(keepingCapacity: false)
                        self.secondArray.removeAll(keepingCapacity: false)
                        self.cityArray.removeAll(keepingCapacity: false)
                        self.townArray.removeAll(keepingCapacity: false)
                        self.imageArray.removeAll(keepingCapacity: false)
                        self.priceArray.removeAll(keepingCapacity: false)
                        self.advertIdArray.removeAll(keepingCapacity: false)
                        for object in objects! {
                            
                            if let advertId = object.objectId {
                                self.advertIdArray.append(advertId)
                            }
                            if let name = object.object(forKey: "name") as? String {
                                if let surname = object.object(forKey: "surname") as? String {
                                    self.lblNameSurname.text = "\(name) \(surname)"
                                }
                            }
                            
                            if let first = object.object(forKey: "first") as? String {
                                if let second = object.object(forKey: "second") as? String {
                                    self.firstArray.append(first)
                                    self.secondArray.append(second)
                                }
                            }
                            
                            if let city = object.object(forKey: "city") as? String {
                                if let town = object.object(forKey: "town") as? String {
                                    self.cityArray.append(city)
                                    self.townArray.append(town)
                                }
                            }
                            
                            if let price = object.object(forKey: "price") as? String {
                                self.priceArray.append(price)
                            }
                            
                            if let image = object.object(forKey: "imageUrl") as? String {
                                self.imageArray.append(image)
                            }
                            
                            self.lblCurrentAdvertsCount.text = "Current Adverts: \(objects!.count)"
                          
                            
                        }
                        self.tableView.reloadData()
                    }
                   
                }
            }
        }
    }
    
    
    func getSuccessAdvertTradeData(){
        let query = PFQuery(className: "Adverts")
        query.whereKey("isSold", equalTo: true).findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    
                        
                        
                        self.lblSuccessTradeCount.text = "Success Trade: \(objects!.count)"
                    
                }
            }
        }
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
        cell.lblFirstSecond.text = "\(firstArray[indexPath.row]) / \(secondArray[indexPath.row])"
        cell.lblCityTown.text = "\(cityArray[indexPath.row]) / \(townArray[indexPath.row])"
        cell.lblPrice.text = "\(priceArray[indexPath.row]) ₺"
        cell.profileImageView.sd_setImage(with: URL(string: imageArray[indexPath.row]))
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "otherprofiletodetailsVC" {
            let destination = segue.destination as! UINavigationController
            let destinationVC = destination.topViewController as! DetailsViewController
            destinationVC.chosenAdvertId = self.selectId
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectId = advertIdArray[indexPath.row]
        self.performSegue(withIdentifier: "otherprofiletodetailsVC", sender: nil)
    }

   
    
    @IBAction func btnBackClicked(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    

}
