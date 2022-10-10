//
//  MyAdvertsViewController.swift
//  stuff
//
//  Created by Yigit on 14.09.2022.
//

import UIKit
import Parse
class MyAdvertsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var advertsTableView: UITableView!
    
    var advertNameArray = [String]()
    var idArray = [String]()
    var selectId = ""
    var isSold = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        advertsTableView.delegate = self
        advertsTableView.dataSource = self
        
        

        
        
        
     
        
        
        
        
        

        
    }
    

    
   
     @objc func getAdvertsData(){
        let query = PFQuery(className: "Adverts")
        query.whereKeyExists("imageUrl").whereKey("username", equalTo: PFUser.current()!.username!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
               if objects != nil {
                if objects!.count > 0 {
                    self.advertNameArray.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let advertId = object.objectId {
                            self.idArray.append(advertId)
                        }
                        if let advertsName = object.object(forKey: "advertTitle") as? String? {
                            self.advertNameArray.append(advertsName!)
                        }
                        if let isSold = object.object(forKey: "isSold") as? Bool {
                            if isSold == true {
                                self.isSold = isSold
                            }
                        }
                    }
                    self.advertsTableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getAdvertsData()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectId = idArray[indexPath.row]
        self.performSegue(withIdentifier: "advertstodetailsadvert", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "advertstodetailsadvert" {
            let destinationVC = segue.destination as! AdvertDetailsViewController
            destinationVC.chosenId = selectId
            destinationVC.isSold = isSold
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = self.advertNameArray[indexPath.row]
        content.secondaryText = self.isSold ?  "*sold" : "*on sale"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advertNameArray.count
    }
    func makeAlert(title: String, message: String){
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .default)
           alert.addAction(okButton)
           self.present(alert, animated: true)
       }
    


}

