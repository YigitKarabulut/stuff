//
//  SellViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit
import Parse
class SellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sellArray = ["Phone", "Home stuff", "Electronic", "Bicycle", "Baby and kids", "Spor and outdoor", "Hobby and entertainment", "Clothing and accessories" ]
    
    let sellImageArray = ["iphone", "homekit", "laptopcomputer", "bicycle", "cart.fill", "play.fill", "sportscourt.fill", "cloud.fill" ]
    
  
  
    
    
    
    
    
    
    
    @IBOutlet weak var sellTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sellTableView.delegate = self
        sellTableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "Select a categories"
        
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
                ElectronicModel.sharedInstance.getSmartWatchData()
                ElectronicModel.sharedInstance.getGameConsolesData()
                ElectronicModel.sharedInstance.getTabletData()
                ElectronicModel.sharedInstance.getCameraData()
                ElectronicModel.sharedInstance.getPhoneAccessoriesData()
                ElectronicModel.sharedInstance.getComputerAccessoriesData()
                ElectronicModel.sharedInstance.getHeadphoneData()
                ElectronicModel.sharedInstance.getTvData()
        
        //      Bicycle
                BicycleModel.sharedInstance.getBicycleYearData()
        
        
        
        //      Baby&Kids
                BabyandKidsModel.sharedInstance.getCategoryData()
        
        //      Sports&Outdoorrs
                SportsandOutdoorsModel.sharedInstance.getCategoryData()
        
        //      Hobby
                HobbyModel.sharedInstance.getCategoryData()
        
        //      Clothing&Accessories
                ClothingAndAccessoriesModel.sharedInstance.getCategoryData()
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = sellArray[indexPath.row]
        content.image = UIImage(systemName: sellImageArray[indexPath.row])
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "categoriestophoneinfoVC", sender: nil)
        }
        if indexPath.row == 1 {
            self.performSegue(withIdentifier: "categoriestohomestuffinfoVC", sender: nil)
        }
        if indexPath.row == 2 {
            self.performSegue(withIdentifier: "categoriestoelectronicinfoVC", sender: nil)
        }
        if indexPath.row == 3 {
            self.performSegue(withIdentifier: "categoriestobicycleinfoVC", sender: nil)
        }
        if indexPath.row == 4 {
            self.performSegue(withIdentifier: "categoriestobabyandkidsinfoVC", sender: nil)
        }
        if indexPath.row == 5 {
            self.performSegue(withIdentifier: "categoriestosportsinfoVC", sender: nil)
        }
        if indexPath.row == 6 {
            self.performSegue(withIdentifier: "categoriestohobbyinfoVC", sender: nil)
        }
        if indexPath.row == 7 {
            self.performSegue(withIdentifier: "categoriestoclothinginfoVC", sender: nil)
        }
    }
    
    func phonePreaper(){
        
    }
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoriestophoneinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Phone"
            destinationVC.firstInfoText = "Brand*"
            destinationVC.secondInfoText = "Model*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = PhoneModel.sharedInstance.brandList
            destinationVC.continueErrorMessage = "Brand, model, adver title and explanation can not be empty!"
        }
        if segue.identifier == "categoriestohomestuffinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "HomeStuff"
            destinationVC.firstInfoText = "Where part of home?*"
            destinationVC.secondInfoText = "Select stuff*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = HomeStuffModel.sharedInstance.homePartsList
            destinationVC.continueErrorMessage = "Part of home, stuff, advert title and explanation can not be empty!"
        }
        if segue.identifier == "categoriestoelectronicinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Electronic"
            destinationVC.firstInfoText = "Electronic tool*"
            destinationVC.secondInfoText = "Brand*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = ElectronicModel.sharedInstance.electronicList
            destinationVC.continueErrorMessage = "Electronic tool, brand, advert title and explanation can not be empty!"
        }
        
        if segue.identifier == "categoriestobicycleinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Bicycle"
            destinationVC.firstInfoText = "Bicycle*"
            destinationVC.secondInfoText = "Year*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = BicycleModel.sharedInstance.bicycleList
            destinationVC.continueErrorMessage = "Year, advert title and explanation can not be empty!"
        }
        
        if segue.identifier == "categoriestobabyandkidsinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Baby&Kids"
            destinationVC.firstInfoText = "Select Category*"
            destinationVC.secondInfoText = "Status*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = BabyandKidsModel.sharedInstance.categoryList
            destinationVC.continueErrorMessage = "Category, status, advert title and explanation can not be empty!"
        }
        
        if segue.identifier == "categoriestosportsinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Sports&Outdoors"
            destinationVC.firstInfoText = "Select Category*"
            destinationVC.secondInfoText = "Status*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = SportsandOutdoorsModel.sharedInstance.categoryList
            destinationVC.continueErrorMessage = "Category, status, advert title and explanation can not be empty!"
        }
        
        if segue.identifier == "categoriestohobbyinfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Hobby&Entertainment"
            destinationVC.firstInfoText = "Select Category*"
            destinationVC.secondInfoText = "Status*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = HobbyModel.sharedInstance.categoryList
            destinationVC.continueErrorMessage = "Category, status, advert title and explanation can not be empty!"
       
        }
        
        if segue.identifier == "categoriestoclothinginfoVC" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.selectCategory = "Clothing&Accessories"
            destinationVC.firstInfoText = "Select Category*"
            destinationVC.secondInfoText = "Status*"
            destinationVC.advertTitleText = "Advert title*"
            destinationVC.explanationText = "Explanation*"
            destinationVC.firstInfoList = ClothingAndAccessoriesModel.sharedInstance.categoryList
            destinationVC.continueErrorMessage = "Category, status, advert title and explanation can not be empty!"
        }
        
        
        
    }
    
    
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
        
    }
    
}



