//
//  ZLBannerView.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/15.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit
import GoogleMobileAds


class ZLBannerView: UIView {
    
    var adsType: BannerAdsType = .normal
    
    
    init(type: BannerAdsType) {
        super.init(frame: CGRect.zero)
        adsType = type
        initUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    func initUI() {
        self.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        self.isUserInteractionEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(isClickAd(notif:)), name: NSNotification.Name(rawValue: ZLAdNotification.isClickAd), object: nil)
    }
    
    @objc func isClickAd(notif: NSNotification) {
        guard let isClick: Bool = notif.object as! Bool? else { return }
        self.isUserInteractionEnabled = isClick
    }
    
    lazy var bannerView: GADBannerView = {
        let temp = GADBannerView(adSize: adsType == .normal ? kGADAdSizeSmartBannerPortrait : kGADAdSizeMediumRectangle)
        temp.adUnitID = GoogleMobileAds.bannerID
        temp.rootViewController = UIViewController.current()
        temp.load(GADRequest())
        temp.delegate = self
        return temp
    }()
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ZLBannerView: GADBannerViewDelegate {
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// 告诉委托，用户单击将打开另一个应用程序(如应用程序商店)，以当前应用程序为背景。
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
        ZLGlobalTimer.shared.openTimer {
            
        }
    }
}
