//
//  LocationModel.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import Foundation
import UIKit
import Parse

class PhoneModel {
    static let sharedInstance = PhoneModel()
    
    
    var category = "Phone"
    var brand = ""
    var model = ""
    var advertTitle = ""
    var explanation = ""
    var firsImage = UIImage()
    var secondImage = UIImage()
    var thirdImage = UIImage()
    var fourthImage = UIImage()
    var locationLatitude = ""
    var locationLongitude = ""
    var brandList = [String]()
    var appleList = [String]()
    var huaewiList = [String]()
    var samsungList = [String]()
    var xiaomiList = [String]()
   
    
    func getBrandsData() {
        let query = PFQuery(className: "Brands")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    self.brandList.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let brandName = object.object(forKey: "name") as? String {
                            self.brandList.append(brandName)
                        }
                    }
                    
                    
                }
            }
        }
    }
    
    func getAppleData(){
        let query = PFQuery(className: "Models")
        query.whereKey("brand", equalTo: "Apple").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    self.appleList.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let appleName = object.object(forKey: "name") as? String {
                            self.appleList.append(appleName)
                            
                        }
                    }
                    
                    
                }
            }
        }
    }
    
    func getHuaweiData(){
        let query = PFQuery(className: "Models")
        query.whereKey("brand", equalTo: "Huawei").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    self.huaewiList.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let huaweiName = object.object(forKey: "name") as? String {
                            self.huaewiList.append(huaweiName)
                        }
                    }
                    
                    
                }
            }
        }

    }
    
    func getXiaomiData(){
        let query = PFQuery(className: "Models")
        query.whereKey("brand", equalTo: "Xiaomi").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    self.xiaomiList.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let xiaomiName = object.object(forKey: "name") as? String {
                            self.xiaomiList.append(xiaomiName)
                        }
                    }
                    
                    
                }
            }
        }

    }
    func getSamsungData(){
        let query = PFQuery(className: "Models")
        query.whereKey("brand", equalTo: "Samsung").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    self.samsungList.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let samsungName = object.object(forKey: "name") as? String {
                            self.samsungList.append(samsungName)
                        }
                    }
                    
                    
                }
            }
        }

    }
    
    
    
  
    private init(){}
    
}
