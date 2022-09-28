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
    
    var selectCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstImage.image = UIImage(named: "selectimage")
        secondImage.image = UIImage(named: "selectimage")
        thirdImage.image = UIImage(named: "selectimage")
        fourthImage.image = UIImage(named: "selectimage")
        
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

        if firstImage.image != UIImage(named: "selectimage") {
            
            secondPicker.delegate = self
                        secondPicker.sourceType = .photoLibrary
                        self.present(secondPicker, animated: true)
        }
            
        
    }
    
    @objc func chooseThirdImage(){
        if secondImage.image != UIImage(named: "selectimage") {

            thirdPicker.delegate = self
            thirdPicker.sourceType = .photoLibrary
            self.present(thirdPicker, animated: true)

        }
     
    }
    
    @objc func chooseFourthImage(){
        if thirdImage.image != UIImage(named: "selectimage") {
            fourthPicker.delegate = self
                       fourthPicker.sourceType = .photoLibrary
                       self.present(fourthPicker, animated: true)
        }

           
        
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
        if firstImage.image != UIImage(named: "selectimage") && secondImage.image != UIImage(named: "selectimage") && thirdImage.image != UIImage(named: "selectimage") && fourthImage.image != UIImage(named: "selectimage")   {
            if selectCategory == "Phone"{
                let phoneModel = PhoneModel.sharedInstance
                phoneModel.firsImage = firstImage.image!
                phoneModel.secondImage = secondImage.image ?? UIImage()
                phoneModel.thirdImage = thirdImage.image ?? UIImage()
                phoneModel.fourthImage = fourthImage.image ?? UIImage()
            }
            if selectCategory == "HomeStuff" {
                let homestuffModel = HomeStuffModel.sharedInstance
                homestuffModel.firsImage = firstImage.image!
                homestuffModel.secondImage = secondImage.image ?? UIImage()
                homestuffModel.thirdImage = thirdImage.image ?? UIImage()
                homestuffModel.fourthImage = fourthImage.image ?? UIImage()
            }
            if selectCategory == "Electronic" {
                let electronicModel = ElectronicModel.sharedInstance
                electronicModel.firsImage = firstImage.image!
                electronicModel.secondImage = secondImage.image ?? UIImage()
                electronicModel.thirdImage = thirdImage.image ?? UIImage()
                electronicModel.fourthImage = fourthImage.image ?? UIImage()
            }
            
            if selectCategory == "Bicycle" {
                let bicycleModel = BicycleModel.sharedInstance
                bicycleModel.firsImage = firstImage.image!
                bicycleModel.secondImage = secondImage.image ?? UIImage()
                bicycleModel.thirdImage = thirdImage.image ?? UIImage()
                bicycleModel.fourthImage = fourthImage.image ?? UIImage()
            }
            
            if selectCategory == "Baby&Kids" {
                let babyandKidsModel = BabyandKidsModel.sharedInstance
                babyandKidsModel.firsImage = firstImage.image!
                babyandKidsModel.secondImage = secondImage.image ?? UIImage()
                babyandKidsModel.thirdImage = thirdImage.image ?? UIImage()
                babyandKidsModel.fourthImage = fourthImage.image ?? UIImage()
            }
            
            if selectCategory == "Sports&Outdoors" {
                let sportsandOutdoorsModel = SportsandOutdoorsModel.sharedInstance
                sportsandOutdoorsModel.firsImage = firstImage.image!
                sportsandOutdoorsModel.secondImage = secondImage.image ?? UIImage()
                sportsandOutdoorsModel.thirdImage = thirdImage.image ?? UIImage()
                sportsandOutdoorsModel.fourthImage = fourthImage.image ?? UIImage()
            }
            
            if selectCategory == "Hobby&Entertainment" {
                let hobbyModel = HobbyModel.sharedInstance
                hobbyModel.firsImage = firstImage.image!
                hobbyModel.secondImage = secondImage.image ?? UIImage()
                hobbyModel.thirdImage = thirdImage.image ?? UIImage()
                hobbyModel.fourthImage = fourthImage.image ?? UIImage()
            }
            
            
            if selectCategory == "Clothing&Accessories" {
                let clothingModel = ClothingAndAccessoriesModel.sharedInstance
                clothingModel.firsImage = firstImage.image!
                clothingModel.secondImage = secondImage.image ?? UIImage()
                clothingModel.thirdImage = thirdImage.image ?? UIImage()
                clothingModel.fourthImage = fourthImage.image ?? UIImage()
            }
            
            
            
            
            
            
            
            self.performSegue(withIdentifier: "imagetopriceVC", sender: nil)
        } else {
            self.makeAlert(title: "Error", message: "Please select an image!")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imagetopriceVC" {
            let destinationVC = segue.destination as! PriceAndLocationViewController
            destinationVC.selectCategory = self.selectCategory
        }
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
        
    }
}
