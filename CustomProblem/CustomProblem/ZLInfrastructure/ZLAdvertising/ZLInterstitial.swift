//
//  ZLInterstitial.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/15.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ZLInterstitial: NSObject {
    
    typealias CloseBlock = ()->()

    var closeBlock: CloseBlock?

    static let shared = ZLInterstitial()

    var interstitial: GADInterstitial!

    func loadAd() {
        interstitial = createAndLoadInterstitial()
    }
    
    func openAd() {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: UIViewController.current()!)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: GoogleMobileAds.interstitialID)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
}

extension ZLInterstitial: GADInterstitialDelegate {
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        if closeBlock != nil {
            closeBlock!()
        }
    }
}
