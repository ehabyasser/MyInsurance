//
//  SearchViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseDatabase

class SearchViewController: UIViewController {
    var companies : [CompanyModel] = []
    var filteredCompanies : [CompanyModel] = []
    @IBOutlet weak var companiesCol: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = search
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        }
        self.definesPresentationContext = true
        companiesCol.delegate = self
        companiesCol.dataSource = self
        companiesCol.register(UINib(nibName: "CompaniesCollectionViewCell", bundle: nil),
                              forCellWithReuseIdentifier: "CompaniesCollectionViewCell")
        ref = Database.database().reference()
        getCompanies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if #available(iOS 11.0, *) {
               navigationItem.hidesSearchBarWhenScrolling = false
           }
       }
    
   func getCompanies(){
       AlertUtilites.loading(message: loading)
       ref.child("companies").observe(.value) { (snapshot) in
           AlertUtilites.stopLoading()
           for snap in snapshot.children {
               let key = (snap as! DataSnapshot).key
                  print("key \(key)")
               if let value = (snap as! DataSnapshot).value as? [String: String] {
                   let company = CompanyModel(name: value["name"] ?? "" , nameAr: value["nameAr"] ?? "", image: value["image"] ?? "", key: key)
                   print("companyName \(company.name)")
                   self.companies.append(company)
               }
           }
           self.filteredCompanies = self.companies
           self.companiesCol.reloadData()
           print("count \(self.companies.count)")
       }
   }


}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text!
        if text.isEmpty{
            filteredCompanies = companies
        }else{
            filteredCompanies = companies.filter { $0.name.lowercased().contains(text.lowercased())  || $0.nameAr.lowercased().contains(text.lowercased())}
        }
        self.companiesCol.reloadData()
       print("text is \(text)")
    }
}

extension SearchViewController : UICollectionViewDelegate , UICollectionViewDataSource ,
UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCompanies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompaniesCollectionViewCell", for: indexPath) as! CompaniesCollectionViewCell
        let company: CompanyModel
        company = filteredCompanies[indexPath.row]
        print("company \(company.image)")
        let url = URL(string: company.image)
        let processor = DownsamplingImageProcessor(size: cell.companyImage.frame.size)
            |> RoundCornerImageProcessor(cornerRadius: 2)
        cell.companyImage.kf.indicatorType = .activity
        cell.companyImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "logo"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openServicesPage(company: filteredCompanies[indexPath.row])
    }
    
    func openServicesPage(company : CompanyModel){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ServicesViewController") as! ServicesViewController
        vc.company = company
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
