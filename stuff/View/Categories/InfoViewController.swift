//
//  CarViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit
import DropDown
import Parse

class InfoViewController: UIViewController, UITextFieldDelegate{
    
   
    
    

    @IBOutlet weak var txtFirstInfo: UITextField!
    
    @IBOutlet weak var txtSecondInfo: UITextField!
    
    
    
    @IBOutlet weak var txtAdvertTitle: UITextField!
    
    @IBOutlet weak var txtExplanation: UITextField!
    
    var firstInfoList = [String]()
    
    
    
    
    
    

    var selectCategory = ""
  
    var continueErrorMessage = ""
    var firstInfoText = ""
    var secondInfoText = ""
    var advertTitleText = ""
    var explanationText = ""
    var alertMessage = ""
    
    
   
    let dropDown = DropDown()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFirstInfo.delegate = self
        txtSecondInfo.delegate = self
        txtFirstInfo.placeholder = firstInfoText
        txtSecondInfo.placeholder = secondInfoText
        txtAdvertTitle.placeholder = advertTitleText
        txtExplanation.placeholder = explanationText
        
        
    
        
      
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

 
  
  
    
 
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFirstInfo {
            self.txtFirstInfo.endEditing(true)
            dropDown.anchorView = txtFirstInfo
            dropDown.dataSource = firstInfoList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtFirstInfo.text = firstInfoList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Apple"{
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.appleList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.appleList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Samsung" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.samsungList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.samsungList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Xiaomi" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.xiaomiList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.xiaomiList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Huawei" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.huaewiList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.huaewiList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Living room" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.livingRoomList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.livingRoomList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Bedroom" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.bedroomList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.bedroomList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Kitchen" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.kitchenList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.kitchenList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Cellar" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.cellarList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.cellarList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Bathroom" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.bathroomList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.bathroomList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Laptop" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.laptopList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.laptopList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Smart Watch" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.smartwatchList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.smartwatchList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Game Consoles" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.gameconsolesList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.gameconsolesList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Camera" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.cameraList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.cameraList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Tablet" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.tabletList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.tabletList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Phone Accessories" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.phoneAccessoriesList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.phoneAccessoriesList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Computer Accessories" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.computerAccessoriesList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.computerAccessoriesList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Headphone" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.headphoneList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.headphoneList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "TV" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.tvList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = secondInfoText
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.tvList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Desktop Computer" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.desktopComputerList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.desktopComputerList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Bicycle" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BicycleModel.sharedInstance.yearList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BicycleModel.sharedInstance.yearList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Baby Clothing" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BabyandKidsModel.sharedInstance.genderList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Gender*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BabyandKidsModel.sharedInstance.genderList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Baby Stuff" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BabyandKidsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BabyandKidsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "The Stroller" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BabyandKidsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BabyandKidsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Toys" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BabyandKidsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BabyandKidsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Baby Books" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BabyandKidsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BabyandKidsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Other" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = BabyandKidsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = BabyandKidsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Sports Equipment" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = SportsandOutdoorsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = SportsandOutdoorsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Exercise Equipment" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = SportsandOutdoorsModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = SportsandOutdoorsModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Pet Products" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HobbyModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HobbyModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Musical Instruments" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HobbyModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HobbyModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Film and Music" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HobbyModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HobbyModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Book" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HobbyModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HobbyModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Board Games" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HobbyModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HobbyModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Clothing" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ClothingAndAccessoriesModel.sharedInstance.bodySizeList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Size*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ClothingAndAccessoriesModel.sharedInstance.bodySizeList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Shoes" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ClothingAndAccessoriesModel.sharedInstance.shoesSizeList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Size*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ClothingAndAccessoriesModel.sharedInstance.shoesSizeList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Jewelry" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ClothingAndAccessoriesModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ClothingAndAccessoriesModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Watch" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ClothingAndAccessoriesModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ClothingAndAccessoriesModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Bag" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ClothingAndAccessoriesModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ClothingAndAccessoriesModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Personal Care and Beauty" {
            self.txtSecondInfo.endEditing(true)
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ClothingAndAccessoriesModel.sharedInstance.statusList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            txtSecondInfo.placeholder = "Status*"
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ClothingAndAccessoriesModel.sharedInstance.statusList[index]
            }
            dropDown.show()
        }
        
        
        
        
        
    }
    
    
    
    

    
    
    
    @IBAction func btnContinueClicked(_ sender: Any) {
        
        if txtFirstInfo.text != "" && txtSecondInfo.text != "" && txtAdvertTitle.text != "" && txtExplanation.text != "" {
            if selectCategory == "Phone" {
                let phoneModel = PhoneModel.sharedInstance
                phoneModel.brand = txtFirstInfo.text!
                phoneModel.model = txtSecondInfo.text!
                phoneModel.advertTitle = txtAdvertTitle.text!
                phoneModel.explanation = txtExplanation.text!
            }
            
            if selectCategory == "HomeStuff" {
                let homestuffModel = HomeStuffModel.sharedInstance
                homestuffModel.homePart = txtFirstInfo.text!
                homestuffModel.stuff = txtSecondInfo.text!
                homestuffModel.advertTitle = txtAdvertTitle.text!
                homestuffModel.explanation = txtExplanation.text!
            }
            
            if selectCategory == "Electronic" {
                let electronicModel = ElectronicModel.sharedInstance
                electronicModel.electronicTool = txtFirstInfo.text!
                electronicModel.brand = txtSecondInfo.text!
                electronicModel.advertTitle = txtAdvertTitle.text!
                electronicModel.explanation = txtExplanation.text!
            }
            if selectCategory == "Bicycle" {
                let bicycleModel = BicycleModel.sharedInstance
                bicycleModel.name = txtFirstInfo.text!
                bicycleModel.year = txtSecondInfo.text!
                bicycleModel.advertTitle = txtAdvertTitle.text!
                bicycleModel.explanation = txtExplanation.text!
            }
            if selectCategory == "Baby&Kids" {
                let babyandKidsModel = BabyandKidsModel.sharedInstance
                babyandKidsModel.name = txtFirstInfo.text!
                babyandKidsModel.status = txtSecondInfo.text!
                babyandKidsModel.advertTitle = txtAdvertTitle.text!
                babyandKidsModel.explanation = txtExplanation.text!
            }
            
            if selectCategory == "Sports&Outdoors" {
                let sportsandOutdoorsModel = SportsandOutdoorsModel.sharedInstance
                sportsandOutdoorsModel.name = txtFirstInfo.text!
                sportsandOutdoorsModel.status = txtSecondInfo.text!
                sportsandOutdoorsModel.advertTitle = txtAdvertTitle.text!
                sportsandOutdoorsModel.explanation = txtExplanation.text!
            }
            
            if selectCategory == "Hobby&Entertainment" {
                let hobbyModel = HobbyModel.sharedInstance
                hobbyModel.name = txtFirstInfo.text!
                hobbyModel.status = txtSecondInfo.text!
                hobbyModel.advertTitle = txtAdvertTitle.text!
                hobbyModel.explanation = txtExplanation.text!
            }
            
            if selectCategory == "Clothing&Accessories" {
                let clothingModel = ClothingAndAccessoriesModel.sharedInstance
                clothingModel.name = txtFirstInfo.text!
                clothingModel.status = txtSecondInfo.text!
                clothingModel.advertTitle = txtAdvertTitle.text!
                clothingModel.explanation = txtExplanation.text!
            }
            
            
            
            
     
            
            self.performSegue(withIdentifier: "infotoimageVC", sender: nil)
            
            
        } else {
            self.makeAlert(title: "Error", message: continueErrorMessage)
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infotoimageVC" {
            let destinationNC = segue.destination as! UINavigationController
            let destinationVC = destinationNC.topViewController as! ImageViewController
            destinationVC.selectCategory = self.selectCategory
        }
    }
    
   


    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
  
    

}
