//
//  EditPasswordViewController.swift
//  stuff
//
//  Created by Yigit on 15.09.2022.
//

/*import UIKit
import Parse
class EditPasswordViewController: UIViewController {

    @IBOutlet weak var txtCurrentPassword: UITextField!
   
    @IBOutlet weak var txtNewPassword: UITextField!
    
    @IBOutlet weak var txtNewPasswordAgain: UITextField!
    
    
    let currentUser = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    
    }
    

    @IBAction func btnSaveClicked(_ sender: Any) {
        
        if txtCurrentPassword.text ==  currentUser!.password?.description ?? "12"{
            self.makeAlert(title: "Succes", message: "passowrd correct")
        } else {
            self.makeAlert(title: "Error", message: "Current password don't match database")
        }
        
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}*/
