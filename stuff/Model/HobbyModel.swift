//
//  HobbyModel.swift
//  stuff
//
//  Created by Yigit on 20.09.2022.
//

import Foundation
import Parse
import UIKit

class HobbyModel {
    static let sharedInstance = HobbyModel()
    var category = "Sport&Outdoors"
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
    
    func getCategoryData() {
        let query = PFQuery(className: "Hobby")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.categoryList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let category = object.object(forKey: "category") as? String {
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
