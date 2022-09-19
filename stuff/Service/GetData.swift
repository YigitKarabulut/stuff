//
//  GetData.swift
//  stuff
//
//  Created by Yigit on 19.09.2022.
//

import Foundation
import Parse

class GetData {
    
    let queryHomeStuff = PFQuery(className: "PartsOfHome")
    
    
    
    func getLivingRoomData(){
        queryHomeStuff.whereKey("partHome", equalTo: "Living room").findObjectsInBackground { objects, error in
            if error != nil {
                print("error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            let name = object.object(forKey: "name") as? String
                        }
                    }
                }
            }
        }
        
    }
    
    
   
}
