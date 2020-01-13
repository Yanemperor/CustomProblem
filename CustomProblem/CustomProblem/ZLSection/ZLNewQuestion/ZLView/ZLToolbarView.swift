//
//  ZLToolbarView.swift
//  CustomProblem
//
//  Created by 周子龙 on 2020/1/8.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit
import AipOcrSdk
import SwiftyJSON

class ZLToolbarView: UIView {

    let images: Array<String> = ["toolbar_camera", "toolbar_voice", "toolbar_down"]
    
    typealias TextBlock = (String) -> ()
    
    var textBlock: TextBlock?
    var voiceBlock: TextBlock?
    var hidKeyboardBlock: TextBlock?
    
    init() {
        super.init(frame: CGRect.zero)
        initUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    func initUI() {
        let btnWidth: CGFloat = kScreenWidth / CGFloat(images.count)
        
        for index in 0..<images.count {
            let button: UIButton = UIButton(frame: CGRect(x: CGFloat(index) * btnWidth, y: 0, width: btnWidth, height: autoSize(number: 40)))
            button.tag = index + 1000
            button.setImage(UIImage(named: images[index]), for: .normal)
            button.addTarget(self, action: #selector(buttonClick(btn:)), for: .touchUpInside)
            self.addSubview(button)
        }
    }
    
    @objc func buttonClick(btn: UIButton) {
        if btn.tag == 1000 {
            generalOCR()
        }else if btn.tag == 1001 {
            if self.voiceBlock != nil {
                self.voiceBlock!("")
            }
        }else if btn.tag == 1002 {
            if self.hidKeyboardBlock != nil {
                self.hidKeyboardBlock!("")
            }
        }
    }
    
    func generalOCR() {
        let vc = AipGeneralVC.viewController { (image) in
            let options: Dictionary = ["language_type": "CHN_ENG", "detect_direction": "true"]
            AipOcrService.shard()?.detectTextBasic(from: image, withOptions: options, successHandler: { (data) in
                DispatchQueue.main.async {
                    let json = JSON(data ?? "")
                    let array: Array = json["words_result"].arrayValue
                    var text: String = ""
                    for dic in array {
                        text = text + dic["words"].stringValue + "\n"
                    }
                    
                    
                    UIViewController.current()?.dismiss(animated: true, completion: nil)
                    print(text)
                    if self.textBlock != nil {
                        self.textBlock!(text)
                    }
                }
            }, failHandler: { (error) in
                print(error)
            })
        }
        UIViewController.current()?.present(vc!, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
