//
//  LoginViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLoginClicked(_ sender: Any) {
        if txtUsername.text != "" && txtPassword.text != "" {
            PFUser.logInWithUsername(inBackground: txtUsername.text!, password: txtPassword.text!) { user, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "logintofeedVC", sender: nil)
                }
            }
        }
        
    }
    
    
    @IBAction func btnSignupClicked(_ sender: Any) {
        performSegue(withIdentifier: "logintosignupVC", sender: nil)
    }
    
    func makeAlert(title: String, message: String){
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .default)
           alert.addAction(okButton)
           self.present(alert, animated: true)
       }
    
}
