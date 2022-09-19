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
    var brand = ""
    var model = ""
    var status = ""
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
    
    func getElectronicData(){
        let query = PFQuery(className: "Electronic")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            self.electronicList.removeAll(keepingCapacity: false)
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
    
    
    
    
    private init () {}
}
