//
//  Bicycle.swift
//  stuff
//
//  Created by Yigit on 20.09.2022.
//

import Foundation
import Parse
import UIKit

class BicycleModel {
    static let sharedInstance = BicycleModel()
    var category = "Bicycle"
    var name = ""
    var year = ""
    var advertTitle = ""
    var explanation = ""
    var firsImage = UIImage()
    var secondImage = UIImage()
    var thirdImage = UIImage()
    var fourthImage = UIImage()
    var locationLatitude = ""
    var locationLongitude = ""
    var yearList = [String]()
    var bicycleList = ["Bicycle"]
    
    func getBicycleYearData() {
        let query = PFQuery(className: "Bicycle")
        query.findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.yearList.removeAll(keepingCapacity: false)
                        for object in objects! {
                            if let year = object.object(forKey: "year") as? String {
                                self.yearList.append(year)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    private init () {}
}
