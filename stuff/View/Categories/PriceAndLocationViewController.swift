//
//  PriceAndLocationViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit
import MapKit
import CoreLocation
import Parse
class PriceAndLocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var txtPrice: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtTown: UITextField!
    
    var locationManager = CLLocationManager()
    
    let current = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        txtCity.isEnabled = false
        txtTown.isEnabled = false
        txtPrice.isEnabled = false
    
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation))
        gesture.minimumPressDuration = 1
        mapView.addGestureRecognizer(gesture)
        
        
        
        
         
    }
    
    @objc func chooseLocation(gesture: UILongPressGestureRecognizer){
            if gesture.state == .began {
                let touchPoint = gesture.location(in: self.mapView)
                let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                
                PhoneModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                PhoneModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                let annotation = MKPointAnnotation()
                annotation.coordinate = touchedCoordinate
                annotation.title = PhoneModel.sharedInstance.brand
                annotation.subtitle = PhoneModel.sharedInstance.model
                self.mapView.addAnnotation(annotation)
                txtCity.isEnabled = true
                txtTown.isEnabled = true
                txtPrice.isEnabled = true
                
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    
    @IBAction func btnSellClicked(_ sender: Any) {
        
        if txtCity.text != "" && txtTown.text != "" && txtPrice.text != ""  {
            
            let phoneModel = PhoneModel.sharedInstance
            
            let object = PFObject(className: "Adverts")
            object["username"] = current!.username!
            object["brand"] = phoneModel.brand
            object["model"] = phoneModel.model
            object["status"] = phoneModel.status
            object["advertTitle"] = phoneModel.advertTitle
            object["explanation"] = phoneModel.explanation
            object["category"] = phoneModel.category
            object["city"] = txtCity.text!
            object["town"] = txtTown.text!
            object["price"] = txtPrice.text!
            object["latitude"] = phoneModel.locationLatitude
            object["longitude"] = phoneModel.locationLongitude
            
            if let imageData1 = phoneModel.firsImage.jpegData(compressionQuality: 0.5) {
                        object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
            }
            if let imageData2 = phoneModel.secondImage.jpegData(compressionQuality: 0.5) {
                        object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
            }
            if let imageData3 = phoneModel.thirdImage.jpegData(compressionQuality: 0.5) {
                        object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
            }
            if let imageData4 = phoneModel.fourthImage.jpegData(compressionQuality: 0.5) {
                        object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
            }
            
            object.saveInBackground { success, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.okAlert()
                }
            }
        } else {
            self.makeAlert(title: "Error", message: "City, town or price can not be empty!")
        }

        
    }
    
    func okAlert(){
        let alert = UIAlertController(title: "Advert", message: "The ad has been submitted for review. If it meets the conditions, the post will be approved.", preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "Ok", style: .default) { alert in
            self.performSegue(withIdentifier: "pricetofeedVC", sender: nil)
        }
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
        
    }
    
 

}
