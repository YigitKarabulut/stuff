//
//  SignupViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtSurname: UITextField!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPasswordAgain: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSignupClicked(_ sender: Any) {
        
        if txtUsername.text != "" && txtEmail.text != "" && txtPassword.text != "" && txtPasswordAgain.text != "" && txtName.text != "" && txtSurname.text != ""  {

            if txtPassword.text == txtPasswordAgain.text  {
                if  txtPassword.text!.count > 6 {
                    if txtEmail.text!.contains("@"){
                        let user = PFUser()
                            user.username = txtUsername.text!
                            user.email = txtEmail.text!
                            user.password = txtPassword.text!
                            user.signUpInBackground { success, error in
                               if error != nil {
                                   self.makeAlert(title: "Error", message: error?.localizedDescription ??  "Error")
                               } else {
                                   self.performSegue(withIdentifier: "signuptologinVC", sender: nil)
                               }
                            }
                    } else {
                        self.makeAlert(title: "Error", message: "Email is not correct")
                    }
                 
                } else {
                    self.makeAlert(title: "Error", message: "Password must bigger 6 characters")
                }
               
            } else {
                self.makeAlert(title: "Error", message: "Passwords are not the same!")
            }
            
        } else {
            self.makeAlert(title: "Error", message: "Username, email or password can not be empty!")
        }
        
        
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
      }
    
   

}
