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
        
        
//      Phone
        PhoneModel.sharedInstance.getBrandsData()
        PhoneModel.sharedInstance.getAppleData()
        PhoneModel.sharedInstance.getHuaweiData()
        PhoneModel.sharedInstance.getXiaomiData()
        PhoneModel.sharedInstance.getSamsungData()
        
//      HomeStuff
        HomeStuffModel.sharedInstance.getHomePartsData()
        HomeStuffModel.sharedInstance.getBedroomData()
        HomeStuffModel.sharedInstance.getKitchenData()
        HomeStuffModel.sharedInstance.getLivingRoomData()
        HomeStuffModel.sharedInstance.getCellarData()
        HomeStuffModel.sharedInstance.getBathroomData()
        
//      Electronic
        ElectronicModel.sharedInstance.getElectronicData()
        ElectronicModel.sharedInstance.getLaptopData()
        

       
       
        
        
        
      
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
 
  
  
    
 
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFirstInfo {
            dropDown.anchorView = txtFirstInfo
            dropDown.dataSource = firstInfoList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtFirstInfo.text = firstInfoList[index]
            }
            dropDown.show()
        }
        
        if textField == txtSecondInfo && txtFirstInfo.text == "Apple"{
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.appleList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.appleList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Samsung" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.samsungList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.samsungList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Xiaomi" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.xiaomiList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.xiaomiList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Huawei" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = PhoneModel.sharedInstance.huaewiList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = PhoneModel.sharedInstance.huaewiList[index]
            }
            dropDown.show()
            
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Living room" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.livingRoomList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.livingRoomList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Bedroom" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.bedroomList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.bedroomList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Kitchen" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.kitchenList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.kitchenList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Cellar" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.cellarList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.cellarList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Bathroom" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = HomeStuffModel.sharedInstance.bathroomList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = HomeStuffModel.sharedInstance.bathroomList[index]
            }
            dropDown.show()
        }
        if textField == txtSecondInfo && txtFirstInfo.text == "Laptop" {
            dropDown.anchorView = txtSecondInfo
            dropDown.dataSource = ElectronicModel.sharedInstance.laptopList
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.direction = .bottom
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.txtSecondInfo.text = ElectronicModel.sharedInstance.laptopList[index]
            }
            dropDown.show()
        }
        
        
        
    }
    
    
    
    

    
    
    
    @IBAction func btnContinueClicked(_ sender: Any) {
        
        if txtFirstInfo.text != "" && txtSecondInfo.text != "" && txtAdvertTitle.text != "" && txtExplanation.text != "" {
            
            let phoneModel = PhoneModel.sharedInstance
            phoneModel.brand = txtFirstInfo.text!
            phoneModel.model = txtSecondInfo.text!
            phoneModel.advertTitle = txtAdvertTitle.text!
            phoneModel.explanation = txtExplanation.text!
            
            self.performSegue(withIdentifier: "phonetoimageVC", sender: nil)
            
            
        } else {
            self.makeAlert(title: "Error", message: continueErrorMessage)
        }
        
        
    }
    
   


    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
        
    }
  
    

}
