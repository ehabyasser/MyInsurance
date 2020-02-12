//
//  MainViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import BmoViewPager
import FirebaseDatabase

protocol PageCellTapped {
    func onPageTapped(company:CompanyModel)
}

class MainViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var viewPager: BmoViewPager!
    var companies : [CompanyModel] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPager.delegate = self
        viewPager.dataSource = self
        ref = Database.database().reference()
        getCompanies()
    }
    
    func changeLang()  {
        var transition: UIView.AnimationOptions = .transitionFlipFromLeft
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        AppDelegate.sharedInstance().window?.rootViewController = controller
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
        }) { (finished) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func changeLanguageBtnDidTapped(_ sender: Any) {
        changeLang()
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
            self.viewPager.reloadData()
            print("count \(self.companies.count)")
        }
    }
}


extension MainViewController : BmoViewPagerDelegate , BmoViewPagerDataSource , PageCellTapped{
    func onPageTapped(company: CompanyModel) {
        openServicesPage(company: company)
    }
    
    
    func bmoViewPagerDelegate(_ viewPager: BmoViewPager, pageChanged page: Int) {
        pageControl.currentPage = page
    }
    
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        pageControl.numberOfPages = companies.count
        return companies.count
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        let vc = PagerItemViewController(company: companies[page] , pageTapped : self)
        return vc
    }
    
    func openServicesPage(company : CompanyModel){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ServicesViewController") as! ServicesViewController
        vc.company = company
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
