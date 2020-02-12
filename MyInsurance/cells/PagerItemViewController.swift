//
//  PagerItemViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import Kingfisher

class PagerItemViewController: UIViewController {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyImg: UIImageView!
    var pageTapped : PageCellTapped?
    var company: CompanyModel?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    convenience init(company: CompanyModel , pageTapped : PageCellTapped) {
        self.init(nibName: "PagerItemViewController", bundle: nil)
        self.company = company
        self.pageTapped = pageTapped
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if L102Language.currentAppleLanguage() == "en"{
            companyName.text = company?.name
        }else{
            companyName.text = company?.nameAr
        }
        companyName.textAlignment = .center
        let url = URL(string: company!.image)
        let processor = DownsamplingImageProcessor(size: companyImg.frame.size)
            |> RoundCornerImageProcessor(cornerRadius: 8)
        companyImg.kf.indicatorType = .activity
        companyImg.kf.setImage(
            with: url,
            placeholder: UIImage(named: "logo"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        companyImg.isUserInteractionEnabled = true
        let ges = UITapGestureRecognizer(target: self, action: #selector(openServicePage))
        companyImg.addGestureRecognizer(ges)
    }
    
    @objc func openServicePage(){
        pageTapped?.onPageTapped(company: company!)
    }
}
