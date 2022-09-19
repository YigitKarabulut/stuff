//
//  HomeStuffModel.swift
//  stuff
//
//  Created by Yigit on 19.09.2022.
//

import Foundation
import Parse
import UIKit
class HomeStuffModel {
    
    static let sharedInstance = HomeStuffModel()
    
    var category = "Home Stuff"
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
    
    var homePartsList = [String]()
    var livingRoomList = [String]()
    var bedroomList = [String]()
    var kitchenList = [String]()
    var cellarList = [String]()
    var bathroomList = [String]()
    
    func getHomePartsData(){
        let query = PFQuery(className: "HomeParts")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    self.homePartsList.removeAll(keepingCapacity: false)
                    for object in objects! {
                        if let homePartName = object.object(forKey: "name") as? String {
                            self.homePartsList.append(homePartName)
                        }
                    }
                }
            }
        }
    }
    
    
    func getLivingRoomData(){
        let query = PFQuery(className: "PartsOfHome")
        query.whereKey("partHome", equalTo: "Living room").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            self.livingRoomList.removeAll(keepingCapacity: false)
                            if let name = object.object(forKey: "name") as? String {
                                self.livingRoomList.append(name)
                            }
                        }
                    }
                }
            }
        }
    }

    func getBedroomData() {
        let query = PFQuery(className: "PartsOfHome")
        query.whereKey("partHome", equalTo: "Bedroom").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.bedroomList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "name") as? String {
                                self.bedroomList.append(name)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getKitchenData(){
        let query = PFQuery(className: "PartsOfHome")
        query.whereKey("partHome", equalTo: "Kitchen").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.kitchenList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "name") as? String {
                                self.kitchenList.append(name)
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func getCellarData() {
        let query = PFQuery(className: "PartsOfHome")
        query.whereKey("partHome", equalTo: "Cellar").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.cellarList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "name") as? String {
                                self.cellarList.append(name)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getBathroomData() {
        let query = PFQuery(className: "PartsOfHome")
        query.whereKey("partHome", equalTo: "Bathroom").findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.bathroomList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let name = object.object(forKey: "name") as? String {
                                self.bathroomList.append(name)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    private init () {}
}
