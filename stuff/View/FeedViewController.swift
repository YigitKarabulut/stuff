//
//  ViewController.swift
//  stuff
//
//  Created by Yigit on 10.09.2022.
//

import UIKit
import Parse
import SDWebImage
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lblTop: UILabel!
    var usernameArray = [String]()
    var surnameArray = [String]()
    var priceArray = [String]()
    var advertTitleArray = [String]()
    var imageArrays = [String]()
    var advertIdArrays = [String]()
    var selectAdvertId = ""
    var firstArray = [String]()
    var secondArray = [String]()
    var explanationArray = [String]()
    var firstData = ""
    var lblTopText = "Current Adverts"
    var numberoftop = false
    var numberofdata = false
    var firstorsecond = true
    var btnBar = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.lblTop.text = self.lblTopText
        
     
        if numberoftop == false {
            btnBar = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchClicked))
        } else {
           btnBar = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(btnBackClicked))
        }
        
        self.navigationController?.navigationBar.topItem?.title = "Stuff"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Noteworthy Bold", size: 32) as Any]
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = btnBar
     
        
        
        
        
    }
    
  
   
    
    
    @objc func searchClicked(){
        
        self.performSegue(withIdentifier: "feedtosearchVC", sender: nil)
        
    
    }
    
    @objc func chatClicked(){
        self.performSegue(withIdentifier: "feedtochatsVC", sender: nil)
    }
    
    func getSearchData() {
        let query = PFQuery(className: "Adverts")
        query.whereKeyExists("imageUrl").whereKey( firstorsecond ? "first" : "second", equalTo: self.firstData).whereKey("isSold", equalTo: false).whereKey("username", notEqualTo: PFUser.current()!.username!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
               
                        self.firstArray.removeAll(keepingCapacity: false)
                        self.secondArray.removeAll(keepingCapacity: false)
                        self.explanationArray.removeAll(keepingCapacity: false)
                        self.usernameArray.removeAll(keepingCapacity: false)
                        self.priceArray.removeAll(keepingCapacity: false)
                        self.advertTitleArray.removeAll(keepingCapacity: false)
                        self.imageArrays.removeAll(keepingCapacity: false)
                        self.advertIdArrays.removeAll(keepingCapacity: false)
                            for object in objects! {
                                if let advertId = object.objectId {
                                    self.advertIdArrays.append(advertId)
                                }
                                if let name = object.object(forKey: "name") as? String {
                                    self.usernameArray.append(name)
                                    }
                                if let surname = object.object(forKey: "surname") as? String {
                                    self.surnameArray.append(surname)
                                }
                                if let price = object.object(forKey: "price") as? String {
                                        self.priceArray.append(price)
                                    }
                                if let advertTitle = object.object(forKey: "advertTitle") as? String {
                                        self.advertTitleArray.append(advertTitle)
                                    }
                                if let imageData = object.object(forKey: "imageUrl") as? String {
                                    self.imageArrays.append(imageData)
                                }
                                if let first = object.object(forKey: "first") as? String {
                                    self.firstArray.append(first)
                                }
                                if let second = object.object(forKey: "second") as? String {
                                    self.secondArray.append(second)
                                }
                                if let explanation = object.object(forKey: "explanation") as? String {
                                    self.explanationArray.append(explanation)
                                }
                            }
                        
                        self.tableView.reloadData()
                        
                    }
                 
                
               
                         
                    
                }
            }
        }
    }
    
    func getData(){
        let query = PFQuery(className: "Adverts")
        query.whereKeyExists("imageUrl").whereKey("isSold", equalTo: false).whereKey("username", notEqualTo: PFUser.current()!.username!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.firstArray.removeAll(keepingCapacity: false)
                        self.secondArray.removeAll(keepingCapacity: false)
                        self.explanationArray.removeAll(keepingCapacity: false)
                        self.usernameArray.removeAll(keepingCapacity: false)
                        self.priceArray.removeAll(keepingCapacity: false)
                        self.advertTitleArray.removeAll(keepingCapacity: false)
                        self.imageArrays.removeAll(keepingCapacity: false)
                        self.advertIdArrays.removeAll(keepingCapacity: false)
                            for object in objects! {
                                if let advertId = object.objectId {
                                    self.advertIdArrays.append(advertId)
                                }
                                if let name = object.object(forKey: "name") as? String {
                                    self.usernameArray.append(name)
                                    }
                                if let surname = object.object(forKey: "surname") as? String {
                                    self.surnameArray.append(surname)
                                }
                                if let price = object.object(forKey: "price") as? String {
                                        self.priceArray.append(price)
                                    }
                                if let advertTitle = object.object(forKey: "advertTitle") as? String {
                                        self.advertTitleArray.append(advertTitle)
                                    }
                                if let imageData = object.object(forKey: "imageUrl") as? String {
                                    self.imageArrays.append(imageData)
                                }
                                if let first = object.object(forKey: "first") as? String {
                                    self.firstArray.append(first)
                                }
                                if let second = object.object(forKey: "second") as? String {
                                    self.secondArray.append(second)
                                }
                                if let explanation = object.object(forKey: "explanation") as? String {
                                    self.explanationArray.append(explanation)
                                }
                            }
                        
                        self.tableView.reloadData()
                        
                    }
                 
                }
               
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        cell.lblInfo.text = advertTitleArray[indexPath.row]
        cell.lblPrice.text = "\(priceArray[indexPath.row]) ₺"
        cell.lblUsername.text = "\(usernameArray[indexPath.row]) \(surnameArray[indexPath.row])"
        cell.feedImageView.sd_setImage(with: URL(string: imageArrays[indexPath.row]))
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.numberofdata == false {
            getData()
        } else {
            getSearchData()
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedtodetailsVC" {
            let destination = segue.destination as! UINavigationController
            let destinationVC = destination.topViewController as! DetailsViewController
            destinationVC.chosenAdvertId = self.selectAdvertId
        }
        if segue.identifier == "feedtosearchVC" {
            let destination = segue.destination as! UINavigationController
            let destinationVC = destination.topViewController as! SearchViewController
            destinationVC.firstArray = self.firstArray
            destinationVC.secondArray = self.secondArray
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectAdvertId = advertIdArrays[indexPath.row]
        self.performSegue(withIdentifier: "feedtodetailsVC", sender: nil)
    }
    func makeAlert(title: String, message: String){
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let okButton = UIAlertAction(title: "OK", style: .default)
          alert.addAction(okButton)
          self.present(alert, animated: true)
      }
      
    
    @objc func btnBackClicked() {
        self.dismiss(animated: true)
    }


}

