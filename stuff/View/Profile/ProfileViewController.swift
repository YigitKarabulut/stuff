//
//  PersonViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit
import Parse
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var personTableView: UITableView!
    
    
    let tableNameArray = ["My adverts","Edit profile", "Help","Logout"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personTableView.delegate = self
        personTableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "Profile"
        navigationController?.navigationBar.tintColor = .systemGreen
        
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = tableNameArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "profiletomyadverts", sender: nil)
        }
        if indexPath.row == 1 {
            self.performSegue(withIdentifier: "profiletoeditprofileVC", sender: nil)
        }
        if indexPath.row == 2 {
            self.performSegue(withIdentifier: "profiletohelpVC", sender: nil)
        }
        if indexPath.row == 3 {
            PFUser.logOutInBackground { error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "persontologinVC", sender: nil)
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
