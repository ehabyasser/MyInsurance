//
//  ServicesViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseDatabase

class ServicesViewController: UIViewController {

    @IBOutlet weak var servicesCol: UICollectionView!
    var company : CompanyModel!
    var services : [ServiceModel] = []
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        if L102Language.currentAppleLanguage() == "en"{
            title = company.name
        }else{
            title = company.nameAr
        }
        servicesCol.delegate = self
        servicesCol.dataSource = self
        servicesCol.register(UINib(nibName: "ServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServicesCollectionViewCell")
        getServices()
    }
    
    func getServices(){
        AlertUtilites.loading(message: loading)
        ref.child("services").queryOrdered(byChild: "companyKey").queryEqual(toValue: "08973273-b9b8-408a-9b03-a37f4cbcd1d4").observe(.value) { (snapshot) in
                AlertUtilites.stopLoading()
                  for snap in snapshot.children {
                      let key = (snap as! DataSnapshot).key
                         print("key \(key)")
                      if let value = (snap as! DataSnapshot).value as? [String: String] {
                        let service = ServiceModel(companyKey: value["companyKey"] ?? "" ,image: value["image"] ?? "", name: value["name"] ?? "" , nameAr: value["nameAr"] ?? "")
                          self.services.append(service)
                      }
                  }
            self.servicesCol.reloadData()
            }
    }
    
}
extension ServicesViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        if L102Language.currentAppleLanguage() == "en"{
            cell.serviceName.text = services[indexPath.row].name
        }else{
            cell.serviceName.text = services[indexPath.row].nameAr
        }
        cell.serviceName.textAlignment = .center
        let url = URL(string: services[indexPath.row].image)
        let processor = DownsamplingImageProcessor(size: cell.serviceImage.frame.size)
            |> RoundCornerImageProcessor(cornerRadius: 2)
        cell.serviceImage.kf.indicatorType = .activity
        cell.serviceImage.kf.setImage(
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
        return CGSize(width: 120, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openOrderPage(index: indexPath.row)
    }
    
    func openOrderPage(index:Int){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MotorNewViewController") as! MotorNewViewController
        vc.index = index
        if L102Language.currentAppleLanguage() == "en"{
            vc.title = services[index].name
        }else{
            vc.title = services[index].nameAr
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
