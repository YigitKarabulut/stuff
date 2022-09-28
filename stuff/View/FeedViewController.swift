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
    
    var usernameArray = [String]()
    var surnameArray = [String]()
    var priceArray = [String]()
    var advertTitleArray = [String]()
    var imageArrays = [String]()
    var advertIdArrays = [String]()
    var selectAdvertId = ""
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
       
        self.navigationController?.navigationBar.topItem?.title = "Stuff"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Noteworthy Bold", size: 32) as Any]
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchClicked))
     
        
        
        
        
        
    }
    
    
    
    @objc func searchClicked(){
        
        self.performSegue(withIdentifier: "feedtosearchVC", sender: nil)
        
    
    }
    
    @objc func chatClicked(){
        self.performSegue(withIdentifier: "feedtochatsVC", sender: nil)
    }
    
    func getData(){
        let query = PFQuery(className: "Adverts")
        query.whereKeyExists("imageUrl").whereKey("username", notEqualTo: PFUser.current()!.username!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
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
        getData()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedtodetailsVC" {
            let destination = segue.destination as! UINavigationController
            let destinationVC = destination.topViewController as! DetailsViewController
            destinationVC.chosenAdvertId = self.selectAdvertId
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
      


}

