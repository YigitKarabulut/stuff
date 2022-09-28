//
//  BabyandKidsModel.swift
//  stuff
//
//  Created by Yigit on 20.09.2022.
//

import Foundation
import Parse
import UIKit

class BabyandKidsModel {
    static let sharedInstance = BabyandKidsModel()
    var category = "Baby&Kids"
    var name = ""
    var status = ""
    var advertTitle = ""
    var explanation = ""
    var firsImage = UIImage()
    var secondImage = UIImage()
    var thirdImage = UIImage()
    var fourthImage = UIImage()
    var locationLatitude = ""
    var locationLongitude = ""
    var categoryList = [String]()
    var statusList = ["New","Good", "Worn"]
    var genderList = ["Male", "Female", "Unisex"]
    
    
    func getCategoryData() {
        let query = PFQuery(className: "BabyandKids")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.categoryList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let category = object.object(forKey: "name") as? String {
                                self.categoryList.append(category)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    private init () {}
}
