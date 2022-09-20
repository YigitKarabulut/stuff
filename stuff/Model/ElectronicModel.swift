//
//  ElectronicModel.swift
//  stuff
//
//  Created by Yigit on 19.09.2022.
//

import Foundation
import Parse
import UIKit
class ElectronicModel {
    static let sharedInstance = ElectronicModel()
    
    var category = "Electronic"
    var electronicTool = ""
    var brand = ""
    var advertTitle = ""
    var explanation = ""
    var firsImage = UIImage()
    var secondImage = UIImage()
    var thirdImage = UIImage()
    var fourthImage = UIImage()
    var locationLatitude = ""
    var locationLongitude = ""
    var electronicList = [String]()
    var laptopList = [String]()
    var smartwatchList = [String]()
    var gameconsolesList = [String]()
    var tabletList = [String]()
    var cameraList = [String]()
    var phoneAccessoriesList = [String]()
    var computerAccessoriesList = [String]()
    var headphoneList = [String]()
    var tvList = [String]()
    var desktopComputerList = ["New", "Good", "Worn"]
    
    func getElectronicData(){
        let query = PFQuery(className: "Electronic")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            
                            if let name = object.object(forKey: "name") as? String {
                                self.electronicList.append(name)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func getLaptopData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Laptop").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.laptopList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.laptopList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    func getSmartWatchData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Smart Watch").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.smartwatchList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.smartwatchList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    
    func getGameConsolesData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Game Consoles").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.gameconsolesList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.gameconsolesList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    func getTabletData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Tablet").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.tabletList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.tabletList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    
    func getCameraData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Camera").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.cameraList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.cameraList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    
    func getPhoneAccessoriesData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Phone Accessories").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.phoneAccessoriesList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.phoneAccessoriesList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    func getComputerAccessoriesData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Computer Accessories").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.computerAccessoriesList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.computerAccessoriesList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    func getHeadphoneData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "Headphone").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.headphoneList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.headphoneList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }
    func getTvData(){
        let query = PFQuery(className: "ElectronicTool")
        query.whereKey("category", equalTo: "TV").findObjectsInBackground { objects, error in
            if error != nil {
                
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.tvList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "brand") as? String {
                                self.tvList.append(name)
                            }
                        }
                    }
                }
            }
        }

    }

    
    
    
    
    
    private init () {}
}
