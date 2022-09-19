//
//  Service.swift
//  stuff
//
//  Created by Yigit on 19.09.2022.
//

import Foundation
import Parse
class GetData {
    func getLivingRoomData(listA: Array<String>, makeAlert: Any){
        let query = PFQuery(className: "PartsOfHome")
        query.whereKey("partHome", equalTo: "Living room").findObjectsInBackground { objects, error in
            if error != nil {
                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            if var name = object.object(forKey: "name") as? String {
                                listA.append(name)
                            }
                        }
                    }
                }
            }
        }
    }
}
