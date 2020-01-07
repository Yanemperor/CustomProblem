//
//  ZLHUD.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/14.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import MBProgressHUD

enum HUDShowType {
    case success
    case failure
    case info
    case warning
}

class ZLHUD: NSObject {
    
    open class var shareHUD: ZLHUD {
        return Constants.shardHUD
    }
    
    fileprivate struct Constants {
        static let shardHUD = ZLHUD()
    }
    
    class func loading() {
        if let window = UIApplication.shared.delegate?.window {
            MBProgressHUD.showAdded(to: window!, animated: true)
        }
    }
    class func hide() {
        if let window = UIApplication.shared.delegate?.window {
            MBProgressHUD.hide(for: window!, animated: true)
        }
    }
    class func show(text: String, type: HUDShowType) {
        if let window = UIApplication.shared.delegate?.window {
            let hud = MBProgressHUD.showAdded(to: window!, animated: true)
            //            hud.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            hud.mode = .customView
            //            hud.customView = UIImageView(image:)
            hud.label.text = text
            hud.label.numberOfLines = 0
            hud.hide(animated: true, afterDelay: 1)
        }
    }
}
