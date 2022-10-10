//
//  SearchViewController.swift
//  stuff
//
//  Created by Yigit on 11.09.2022.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var txtSearch = ""
    var firstArray = [String]()
    var secondArray = [String]()
    var searchData1 = ""
    var searchData2 = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .systemGreen
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(btnBackClicked))
        navigationController?.navigationBar.topItem?.title = "Search"
        searchBar.delegate = self
        
        
        

        
    }
    
    @objc func btnBackClicked() {
        self.dismiss(animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        txtSearch = searchBar.text!
        performSegue(withIdentifier: "searchtofeedVC", sender: nil)
        
     
        
        
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "searchtofeedVC" {
            for data in firstArray {
                if data.lowercased().contains(txtSearch.lowercased()) {
                    self.searchData1 = data
                    
                }
            }
            for data2 in secondArray {
                if data2.lowercased().contains(txtSearch.lowercased()) {
                    self.searchData2 = data2
                    
                }
            }
            
            
            
            let navigationVC = segue.destination as! UINavigationController
            let destinationVC = navigationVC.topViewController as! FeedViewController
            destinationVC.lblTopText = "Search results for '\(txtSearch)'"
            if searchData1.isEmpty == true && searchData2.isEmpty == false {
                destinationVC.firstData = searchData2
                destinationVC.firstorsecond = false
            } else if searchData1.isEmpty == false && searchData2.isEmpty == true {
                destinationVC.firstData = searchData1
                
            }
            destinationVC.numberofdata = true
            destinationVC.numberoftop = true
        }
    }
    

    

}
