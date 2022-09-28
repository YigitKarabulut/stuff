//
//  LocationViewController.swift
//  stuff
//
//  Created by Yigit on 22.09.2022.
//

import UIKit
import MapKit
import Parse

class LocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    
    @IBOutlet weak var mapKit: MKMapView!
    
    
    @IBOutlet weak var lblCityTown: UILabel!
    
    @IBOutlet weak var lblFirstSecond: UILabel!
    
    
    var chosenAdvertId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapKit.delegate = self
        
        navigationController?.navigationBar.tintColor = .systemGreen
        
        getLocationData()
       
        
        
        
 
        
        
    }
    
    
    func getLocationData() {
        let query = PFQuery(className: "Adverts")
        query.getObjectInBackground(withId: chosenAdvertId) { object, error in
            if error != nil {
//                makeAlert
            } else {
                if object != nil {
                    if let first = object!.object(forKey: "first") as? String {
                        if let second = object!.object(forKey: "second") as? String {
                            self.lblFirstSecond.text = "\(first) / \(second)"
                        }
                    }
                    if let city = object!.object(forKey: "city") as? String {
                        if let town = object!.object(forKey: "town") as? String {
                            self.lblCityTown.text = "\(city) / \(town)"
                        }
                    }
                    if let latitude = object!.object(forKey: "latitude") as? String {
                        if let latitudeDouble = Double(latitude) {
                            self.chosenLatitude = latitudeDouble
                        }
                    }
                    if let longitude = object!.object(forKey: "longitude") as? String {
                        if let longitudeDouble = Double(longitude) {
                            self.chosenLongitude = longitudeDouble
                        }
                    }
                    let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                    
                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: location, span: span)
                    self.mapKit.setRegion(region, animated: true)
                    let circle = MKCircle(center: location, radius: 1000)
                    self.mapKit.addOverlay(circle)

                    
                }
            }
        }
    }
    
  
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.1)
        circleRenderer.strokeColor = UIColor.blue
        circleRenderer.lineWidth = 1
        return circleRenderer
    }
    



}
