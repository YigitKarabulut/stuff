//
//  ClothingAndAccessoriesModel.swift
//  stuff
//
//  Created by Yigit on 21.09.2022.
//

import Foundation
import Parse
import UIKit

class ClothingAndAccessoriesModel {
    static let sharedInstance = ClothingAndAccessoriesModel()
    var category = "Clothing&Accessories"
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
    var bodySizeList = ["Male - XS", "Male - S", "Male - M", "Male - L", "Male - XL", "Male - XXL","Female - XS", "Female - S", "Female - M", "Female - L", "Female - XL", "Female - XXL"]
    var shoesSizeList = ["34","35","36","37","38","39","40","41","42","43","44","45","46","47"]
    
    
    func getCategoryData() {
        let query = PFQuery(className: "ClothingandAccessories")
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
