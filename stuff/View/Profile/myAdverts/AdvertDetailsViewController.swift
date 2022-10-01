//
//  AdvertDetailsViewController.swift
//  stuff
//
//  Created by Yigit on 14.09.2022.
//

import UIKit
import Parse
class AdvertDetailsViewController: UIViewController {

    
    @IBOutlet weak var lblAdvertname: UILabel!
    
    @IBOutlet weak var advertImage: UIImageView!
    
    @IBOutlet weak var lblExplanation: UILabel!
    
    
    @IBOutlet weak var btnSold: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    

    var chosenId = ""
    var isSold = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getAdvertDetailsData()
        
        if isSold == true {
            btnSold.isEnabled = false
        } else {
            btnSold.isEnabled = true
        }
    }
    

    
    func getAdvertDetailsData(){
        let query = PFQuery(className: "Adverts")
        query.whereKey("objectId", equalTo: chosenId).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                   if objects!.count > 0 {
                        let chosenAdvertObject = objects![0]
                       if let advertName = chosenAdvertObject.object(forKey: "advertTitle") as? String {
                           self.lblAdvertname.text = "\(advertName)"
                       }
                       if let advertExplanation = chosenAdvertObject.object(forKey: "explanation") as? String {
                           self.lblExplanation.text = "\(advertExplanation)"
                       }
                       if let advertPrice = chosenAdvertObject.object(forKey: "price") as? String {
                           self.lblPrice.text = "Price: \(advertPrice)₺"
                       }
                       if let adverImage = chosenAdvertObject.object(forKey: "imageUrl") as? String {
                           self.advertImage.sd_setImage(with: URL(string: adverImage))
                       }
                    }
                }
            }
        }
    }

   
    func deleteData(){
        let query = PFQuery(className: "Adverts")
        query.whereKey("objectId", equalTo: chosenId).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            object.deleteInBackground { success, error in
                                if error != nil {
                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                                } 
                            }
                        }
                    }
                }
                
            }
        }
        
    }
    
    
    @IBAction func btnDeleteClicked(_ sender: Any) { 
        
        makeOrAlert()
    }
    
    func makeOrAlert(){
        let alert = UIAlertController(title: "Delete?", message: "Are you want to delete ?", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default) { alert in
            self.deleteData()
            self.dismiss(animated: true)
            
        }
        let noButton = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        self.present(alert, animated: true)
    }
    
   
    @IBAction func btnSoldClicked(_ sender: Any) {
        let query = PFQuery(className: "Adverts")
        query.getObjectInBackground(withId: self.chosenId) { object, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if let object = object {
                    object["isSold"] = true
                    object.saveInBackground()
                }
            }
        }
        
    }
    
    func makeAlert(title: String, message: String){
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .default)
           alert.addAction(okButton)
           self.present(alert, animated: true)
       }
    
}
