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
    var selectCategory = ""
    var name = ""
    var surname = ""
    
    
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
        
        getNameSurnameData()
        
        
        
        
         
    }
    
    @objc func chooseLocation(gesture: UILongPressGestureRecognizer){
            if gesture.state == .began {
              
                
                if selectCategory == "Phone" {
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
                if selectCategory == "HomeStuff" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    HomeStuffModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    HomeStuffModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = HomeStuffModel.sharedInstance.homePart
                    annotation.subtitle = HomeStuffModel.sharedInstance.stuff
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }
                if selectCategory == "Electronic" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    ElectronicModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    ElectronicModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = ElectronicModel.sharedInstance.electronicTool
                    annotation.subtitle = ElectronicModel.sharedInstance.brand
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }
                
                if selectCategory == "Bicycle" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    BicycleModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    BicycleModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = BicycleModel.sharedInstance.name
                    annotation.subtitle = BicycleModel.sharedInstance.year
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }
                
                if selectCategory == "Baby&Kids" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    BabyandKidsModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    BabyandKidsModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = BabyandKidsModel.sharedInstance.name
                    annotation.subtitle = BabyandKidsModel.sharedInstance.status
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }
                
                if selectCategory == "Sports&Outdoors" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    SportsandOutdoorsModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    SportsandOutdoorsModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = SportsandOutdoorsModel.sharedInstance.name
                    annotation.subtitle = SportsandOutdoorsModel.sharedInstance.status
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }
                
                if selectCategory == "Hobby&Entertainment" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    HobbyModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    HobbyModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = HobbyModel.sharedInstance.name
                    annotation.subtitle = HobbyModel.sharedInstance.status
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }
                
                if selectCategory == "Clothing&Accessories" {
                    let touchPoint = gesture.location(in: self.mapView)
                    let touchedCoordinate = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                    ClothingAndAccessoriesModel.sharedInstance.locationLatitude = String(touchedCoordinate.latitude)
                    ClothingAndAccessoriesModel.sharedInstance.locationLongitude = String(touchedCoordinate.longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = touchedCoordinate
                    annotation.title = ClothingAndAccessoriesModel.sharedInstance.name
                    annotation.subtitle = ClothingAndAccessoriesModel.sharedInstance.status
                    self.mapView.addAnnotation(annotation)
                    txtCity.isEnabled = true
                    txtTown.isEnabled = true
                    txtPrice.isEnabled = true
                }

                
                

                
                
          
                
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    func getNameSurnameData(){
        let query = PFQuery(className: "_User")
        query.whereKey("username", equalTo: current!.username!).findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            if let name = object.object(forKey: "name") as? String {
                                if let surnmae = object.object(forKey: "surname") as? String {
                                    self.name = name
                                    self.surname = surnmae
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func btnSellClicked(_ sender: Any) {
        
        if txtCity.text != "" && txtTown.text != "" && txtPrice.text != "" {
            if self.name != "" && self.surname != "" {
                let phoneModel = PhoneModel.sharedInstance
                let homeStuffModel = HomeStuffModel.sharedInstance
                
                let object = PFObject(className: "Adverts")
                
                
                if selectCategory == "Phone" {
                    object["username"] = current!.username!
                    object["first"] = phoneModel.brand
                    object["second"] = phoneModel.model
                    object["name"] = self.name
                    object["surname"] = self.surname
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
                }
                
                if selectCategory == "HomeStuff" {
                    object["username"] = current!.username!
                    object["first"] = homeStuffModel.homePart
                    object["second"] = homeStuffModel.stuff
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] = homeStuffModel.advertTitle
                    object["explanation"] = homeStuffModel.explanation
                    object["category"] = homeStuffModel.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] = homeStuffModel.locationLatitude
                    object["longitude"] = homeStuffModel.locationLongitude
                    
                    if let imageData1 = homeStuffModel.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 = homeStuffModel.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 = homeStuffModel.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 = homeStuffModel.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }
                
                if selectCategory == "Electronic" {
                    object["username"] = current!.username!
                    object["first"] =  ElectronicModel.sharedInstance.electronicTool
                    object["second"] =  ElectronicModel.sharedInstance.brand
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] =  ElectronicModel.sharedInstance.advertTitle
                    object["explanation"] =  ElectronicModel.sharedInstance.explanation
                    object["category"] =  ElectronicModel.sharedInstance.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] =  ElectronicModel.sharedInstance.locationLatitude
                    object["longitude"] =  ElectronicModel.sharedInstance.locationLongitude
                    
                    if let imageData1 =  ElectronicModel.sharedInstance.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 =  ElectronicModel.sharedInstance.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 =  ElectronicModel.sharedInstance.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 =  ElectronicModel.sharedInstance.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }
                
                if selectCategory == "Bicycle" {
                    object["username"] = current!.username!
                    object["first"] =  BicycleModel.sharedInstance.name
                    object["second"] =  BicycleModel.sharedInstance.year
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] =  BicycleModel.sharedInstance.advertTitle
                    object["explanation"] =  BicycleModel.sharedInstance.explanation
                    object["category"] =  BicycleModel.sharedInstance.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] =  BicycleModel.sharedInstance.locationLatitude
                    object["longitude"] =  BicycleModel.sharedInstance.locationLongitude
                    
                    if let imageData1 =  BicycleModel.sharedInstance.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 =  BicycleModel.sharedInstance.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 =  BicycleModel.sharedInstance.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 =  BicycleModel.sharedInstance.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }
                
                if selectCategory == "Baby&Kids" {
                    object["username"] = current!.username!
                    object["first"] =  BabyandKidsModel.sharedInstance.name
                    object["second"] =  BabyandKidsModel.sharedInstance.status
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] =  BabyandKidsModel.sharedInstance.advertTitle
                    object["explanation"] =  BabyandKidsModel.sharedInstance.explanation
                    object["category"] =  BabyandKidsModel.sharedInstance.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] =  BabyandKidsModel.sharedInstance.locationLatitude
                    object["longitude"] =  BabyandKidsModel.sharedInstance.locationLongitude
                    
                    if let imageData1 =  BabyandKidsModel.sharedInstance.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 =  BabyandKidsModel.sharedInstance.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 =  BabyandKidsModel.sharedInstance.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 =  BabyandKidsModel.sharedInstance.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }
                
                if selectCategory == "Sports&Outdoors" {
                    object["username"] = current!.username!
                    object["first"] =  SportsandOutdoorsModel.sharedInstance.name
                    object["second"] =  SportsandOutdoorsModel.sharedInstance.status
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] =  SportsandOutdoorsModel.sharedInstance.advertTitle
                    object["explanation"] =  SportsandOutdoorsModel.sharedInstance.explanation
                    object["category"] =  SportsandOutdoorsModel.sharedInstance.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] =  SportsandOutdoorsModel.sharedInstance.locationLatitude
                    object["longitude"] =  SportsandOutdoorsModel.sharedInstance.locationLongitude
                    
                    if let imageData1 =  SportsandOutdoorsModel.sharedInstance.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 =  SportsandOutdoorsModel.sharedInstance.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 =  SportsandOutdoorsModel.sharedInstance.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 =  SportsandOutdoorsModel.sharedInstance.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }
                
                if selectCategory == "Hobby&Entertainment" {
                    object["username"] = current!.username!
                    object["first"] =  HobbyModel.sharedInstance.name
                    object["second"] =  HobbyModel.sharedInstance.status
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] =  HobbyModel.sharedInstance.advertTitle
                    object["explanation"] =  HobbyModel.sharedInstance.explanation
                    object["category"] =  HobbyModel.sharedInstance.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] =  HobbyModel.sharedInstance.locationLatitude
                    object["longitude"] =  HobbyModel.sharedInstance.locationLongitude
                    
                    if let imageData1 =  HobbyModel.sharedInstance.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 =  HobbyModel.sharedInstance.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 =  HobbyModel.sharedInstance.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 =  HobbyModel.sharedInstance.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }
                
                if selectCategory == "Clothing&Accessories" {
                    object["username"] = current!.username!
                    object["first"] =  ClothingAndAccessoriesModel.sharedInstance.name
                    object["second"] =  ClothingAndAccessoriesModel.sharedInstance.status
                    object["name"] = self.name
                    object["surname"] = self.surname
                    object["advertTitle"] =  ClothingAndAccessoriesModel.sharedInstance.advertTitle
                    object["explanation"] =  ClothingAndAccessoriesModel.sharedInstance.explanation
                    object["category"] =  ClothingAndAccessoriesModel.sharedInstance.category
                    object["city"] = txtCity.text!
                    object["town"] = txtTown.text!
                    object["price"] = txtPrice.text!
                    object["latitude"] =  ClothingAndAccessoriesModel.sharedInstance.locationLatitude
                    object["longitude"] =  ClothingAndAccessoriesModel.sharedInstance.locationLongitude
                    
                    if let imageData1 =  ClothingAndAccessoriesModel.sharedInstance.firsImage.jpegData(compressionQuality: 0.5) {
                                object["image1"] = PFFileObject(name: "image1.jpg", data: imageData1)
                    }
                    if let imageData2 =  ClothingAndAccessoriesModel.sharedInstance.secondImage.jpegData(compressionQuality: 0.5) {
                                object["image2"] = PFFileObject(name: "image2.jpg", data: imageData2)
                    }
                    if let imageData3 =  ClothingAndAccessoriesModel.sharedInstance.thirdImage.jpegData(compressionQuality: 0.5) {
                                object["image3"] = PFFileObject(name: "image3.jpg", data: imageData3)
                    }
                    if let imageData4 =  ClothingAndAccessoriesModel.sharedInstance.fourthImage.jpegData(compressionQuality: 0.5) {
                                object["image4"] = PFFileObject(name: "image4.jpg", data: imageData4)
                    }
                }


                
                
                
                object.saveInBackground { success, error in
                    if error != nil {
                        self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                    } else {
                        self.okAlert()
                    }
                }
            } else {
                self.makeAlert(title: "Error", message: "You cannot place an ad with an empty name and surname! Go to Edit Profile and save your first and last name!")
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
