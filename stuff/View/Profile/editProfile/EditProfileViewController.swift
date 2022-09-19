//
//  EditProfileViewController.swift
//  stuff
//
//  Created by Yigit on 15.09.2022.
//

import UIKit
import Parse
class EditProfileViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtSurname: UITextField!
    
    
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    let currentUser = PFUser.current()
    
    var name = ""
    var surname = ""
    var username = ""
    var click : Bool = false
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.isEnabled = false
        txtName.isEnabled = false
        txtSurname.isEnabled = false
        txtUsername.isEnabled = false
        
        
        getProfileData()

        
    }
    
    
    func getProfileData(){
        let query = PFQuery(className: "_User")
        query.whereKey("objectId", equalTo: currentUser!.objectId!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            if let title = object.object(forKey: "name") as? String {
                                self.lblTitle.text = "Hi \(title)"
                            }
                            if let username = object.object(forKey: "username") as? String {
                                self.txtUsername.placeholder = username
                                self.username = username
                            }
                            if let name = object.object(forKey: "name") as? String {
                                self.txtName.placeholder = name
                                self.name = name
                            }
                            if let surname = object.object(forKey: "surname") as? String {
                                self.txtSurname.placeholder = surname
                                self.surname = surname
                            }
                            if let email = object.object(forKey: "email") as? String {
                                self.txtEmail.placeholder = email
                            }
                           
                            
                        
                                
                        }
                    }
                }
            }
        }
    }
 
    
    func updateUserData(){
        let query = PFQuery(className: "_User")
        query.getObjectInBackground(withId: currentUser!.objectId!) { user, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if self.txtName.text != "" &&  self.txtSurname.text != "" && self.txtUsername.text != "" {
                    
                    if let user = user {
                        
                                       user["name"] = self.txtName.text
                                       user["surname"] = self.txtSurname.text
                                       user["username"] = self.txtUsername.text
                                       user.saveInBackground { success, error in
                                           if error != nil {
                                               self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                                           } else {
                                               if success == true {
                                                   self.makeAlert(title: "Success", message: "Edition success")
                                               }
                                           }
                                       }
                                   }
                } else {
                    self.makeAlert(title: "Error", message: "Press edit button!")
                }
               
            }
        }
        
    }
    
    
    func updateAdvertsUsernameData(){
        let query = PFQuery(className: "Adverts")
        query.whereKey("username", equalTo: currentUser!.username!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            object["username"] = self.txtUsername.text
                            object.saveInBackground { success, error in
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
    
   
    
  
    @IBAction func btnSaveClicked(_ sender: Any) {
        updateUserData()
        updateAdvertsUsernameData()
        txtName.isEnabled = !txtName.isEnabled
        txtSurname.isEnabled = !txtSurname.isEnabled
        txtUsername.isEnabled = !txtUsername.isEnabled

    }
    
  
    @IBAction func btnEditClicked(_ sender: Any) {
        txtName.isEnabled = !txtName.isEnabled
        txtName.text = name
        if txtName.isEnabled == false {
            self.txtName.text = nil
        }
        txtSurname.isEnabled = !txtSurname.isEnabled
        txtSurname.text = surname
        if txtSurname.isEnabled == false {
            self.txtSurname.text = nil
        }
        txtUsername.isEnabled = !txtUsername.isEnabled
        txtUsername.text = username
        if txtUsername.isEnabled == false {
            self.txtUsername.text = nil
        }
    
    }
    
   
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
 
}
