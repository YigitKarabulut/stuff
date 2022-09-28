//
//  DetailsViewController.swift
//  stuff
//
//  Created by Yigit on 21.09.2022.
//

import UIKit
import Parse
import SDWebImage
import MapKit
class DetailsViewController: UIViewController{

    @IBOutlet weak var lblFirstSecond: UILabel!
    
    @IBOutlet weak var lblNameSurname: UILabel!
    
    @IBOutlet weak var lblExplanation: UILabel!
    
    @IBOutlet weak var lblCityTown: UILabel!
    
    
    
    
    @IBOutlet weak var miniImage1: UIImageView!
    
    @IBOutlet weak var miniImage2: UIImageView!
    
    @IBOutlet weak var miniImage3: UIImageView!
    
    @IBOutlet weak var miniImage4: UIImageView!
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    
    var chosenAdvertId = ""
    var images = [UIImage]()
    var imageUrl = UIImageView()
    var imgListArray = [UIImage]()
    var chosenAdvertUsername = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      
        
       getDetailsData()
    
        miniImage1.isUserInteractionEnabled = true
        miniImage2.isUserInteractionEnabled = true
        miniImage3.isUserInteractionEnabled = true
        miniImage4.isUserInteractionEnabled = true
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(pickImage1))
        miniImage1.addGestureRecognizer(gestureRecognizer1)
        
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(pickImage2))
        miniImage2.addGestureRecognizer(gestureRecognizer2)
        
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(pickImage3))
        miniImage3.addGestureRecognizer(gestureRecognizer3)
        
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(pickImage4))
        miniImage4.addGestureRecognizer(gestureRecognizer4)
        
        
        
        
       
        
        
        
    }
    
    @objc func pickImage1(){
        self.imageViewDetail.image = self.miniImage1.image
    }
    @objc func pickImage2(){
        self.imageViewDetail.image = self.miniImage2.image
    }
    @objc func pickImage3(){
        self.imageViewDetail.image = self.miniImage3.image
    }
    @objc func pickImage4(){
        self.imageViewDetail.image = self.miniImage4.image
    }
    
    func getDetailsData(){
        let query = PFQuery(className: "Adverts")
        query.whereKey("objectId", equalTo: chosenAdvertId).findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.images.removeAll(keepingCapacity: false)
                        for object in objects! {
                            
                            if let first = object.object(forKey: "first") as? String {
                                if let second = object.object(forKey: "second") as? String {
                                    self.lblFirstSecond.text = "\(first) / \(second)"
                                    
                                }
                            }
                            
                            if let username = object.object(forKey: "username") as? String {
                                self.chosenAdvertUsername = username
                            }
                            
                            if let name = object.object(forKey: "name") as? String {
                                if let surname = object.object(forKey: "surname") as? String {
                                    self.lblNameSurname.text = "\(name) \(surname)"
                                }
                            }
                            if let city = object.object(forKey: "city") as? String {
                                if let town = object.object(forKey: "town") as? String {
                                    self.lblCityTown.text = "\(city) / \(town)"
                                }
                            }
                            if let explanation = object.object(forKey: "explanation") as? String {
                                self.lblExplanation.text = explanation
                            }
                            
                            if let imageData1 = object.object(forKey: "image1")  as? PFFileObject {
                                imageData1.getDataInBackground { data, error in
                                    if error != nil {
//                                        makeAlert
                                        
                                        print("hata")
                                    } else {
                                        if data != nil {
                                            if data!.count > 0 {
                                                self.imageViewDetail.image = UIImage(data: data!)
                                                self.miniImage1.image = UIImage(data: data!)
                                                
                                            }
                                        
                                        }
                                    }
                                }
                            }
                            if let imageData2 = object.object(forKey: "image2")  as? PFFileObject {
                                imageData2.getDataInBackground { data, error in
                                    if error != nil {
//                                        makeAlert
                                        print("hata")
                                    } else {
                                        if data != nil {
                                            if data!.count > 0 {
                                                self.miniImage2.image = UIImage(data: data!)
                                                
                                            }
                                        
                                        }
                                    }
                                }
                            }
                            if let imageData3 = object.object(forKey: "image3")  as? PFFileObject {
                                imageData3.getDataInBackground { data, error in
                                    if error != nil {
//                                        makeAlert
                                        print("hata")
                                    } else {
                                        if data != nil {
                                            if data!.count > 0 {
                                                self.miniImage3.image = UIImage(data: data!)
                                                
                                            }
                                        
                                        }
                                    }
                                }
                            }
                            if let imageData4 = object.object(forKey: "image4")  as? PFFileObject {
                                imageData4.getDataInBackground { data, error in
                                    if error != nil {
//                                        makeAlert
                                        print("hata")
                                    } else {
                                        if data != nil {
                                            if data!.count > 0 {
                                                self.miniImage4.image = UIImage(data: data!)
                                                
                                            }
                                        
                                        }
                                    }
                                }
                            }
                            
                          
                        
                        
                            
                        }
                        
                    }
                }
            }
        }
    }
 

    
    
    
    @IBAction func btnProfileClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "detailstoprofileVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailstoprofileVC" {
            let destinationVC = segue.destination as! OtherPofileViewController
            destinationVC.chosenAdvertUsernameId = chosenAdvertUsername
        }
        
        if segue.identifier == "detailstolocationVC" {
            let destinationVC = segue.destination as! LocationViewController
            destinationVC.chosenAdvertId = chosenAdvertId
        }
        
       
    }
    
    
    
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func btnSeeLocationClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "detailstolocationVC", sender: nil)
        
    }
    
    
}
