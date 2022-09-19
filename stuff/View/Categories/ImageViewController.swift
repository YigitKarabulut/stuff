//
//  ImageViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    let firstPicker = UIImagePickerController()
    let secondPicker = UIImagePickerController()
    let thirdPicker = UIImagePickerController()
    let fourthPicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(btnBackClicked))
        navigationController?.navigationBar.tintColor = .systemGreen
        
        
        firstImage.isUserInteractionEnabled = true
        let firstGesture = UITapGestureRecognizer(target: self, action: #selector(chooseFirstImage))
        firstImage.addGestureRecognizer(firstGesture)
        
        secondImage.isUserInteractionEnabled = true
        let secondGesture = UITapGestureRecognizer(target: self, action: #selector(chooseSecondImage))
        secondImage.addGestureRecognizer(secondGesture)
        
        thirdImage.isUserInteractionEnabled = true
        let thirdGesture = UITapGestureRecognizer(target: self, action: #selector(chooseThirdImage))
        thirdImage.addGestureRecognizer(thirdGesture)
        
        fourthImage.isUserInteractionEnabled = true
        let fourthGesture = UITapGestureRecognizer(target: self, action: #selector(chooseFourthImage))
        fourthImage.addGestureRecognizer(fourthGesture)
        
        
        
        
    }
    
    
    @objc func chooseFirstImage(){
        
        firstPicker.delegate = self
        firstPicker.sourceType = .photoLibrary
        self.present(firstPicker, animated: true)
        
    }
    
    @objc func chooseSecondImage(){

        
            secondPicker.delegate = self
            secondPicker.sourceType = .photoLibrary
            self.present(secondPicker, animated: true)
        
    }
    
    @objc func chooseThirdImage(){
        
            thirdPicker.delegate = self
            thirdPicker.sourceType = .photoLibrary
            self.present(thirdPicker, animated: true)
        
     
    }
    
    @objc func chooseFourthImage(){
        
            fourthPicker.delegate = self
            fourthPicker.sourceType = .photoLibrary
            self.present(fourthPicker, animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == firstPicker {
            firstImage.image = info[.originalImage] as? UIImage
        }
        if picker == secondPicker {
            secondImage.image = info[.originalImage] as? UIImage
        }
        if picker == thirdPicker {
            thirdImage.image = info[.originalImage] as? UIImage
        }
        if picker == fourthPicker {
            fourthImage.image = info[.originalImage] as? UIImage
        }
        
        self.dismiss(animated: true)
        
        
        
        
    }
    
    
    
    @objc func btnBackClicked(){
        self.dismiss(animated: true)
    }

    @IBAction func btnContinueClicked(_ sender: Any) {
        if firstImage.image != nil {
            
            let phoneModel = PhoneModel.sharedInstance
            phoneModel.firsImage = firstImage.image!
            phoneModel.secondImage = secondImage.image ?? UIImage()
            phoneModel.thirdImage = thirdImage.image ?? UIImage()
            phoneModel.fourthImage = fourthImage.image ?? UIImage()
            
            
            self.performSegue(withIdentifier: "imagetopriceVC", sender: nil)
        } else {
            self.makeAlert(title: "Error", message: "Please select an image!")
        }
        
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
        
    }
}
