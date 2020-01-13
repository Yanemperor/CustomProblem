//
//  ZLHomeViewController.swift
//  CustomProblem
//
//  Created by 周子龙 on 2019/12/31.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit
import RichEditorView
import AipOcrSdk
import YYText

class ZLHomeViewController: ZLBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    func generalOCR() {
        let vc = AipGeneralVC.viewController { (image) in
            let options: Dictionary = ["language_type": "CHN_ENG", "detect_direction": "true"]
            AipOcrService.shard()?.detectTextBasic(from: image, withOptions: options, successHandler: { (data) in
                print(data)
            }, failHandler: { (error) in
                print(error)
            })
        }
        present(vc!, animated: true, completion: nil)
    }
    
    func initUI() {
        navTitle(title: "")
        
        setRightBarButtonItem(name: "新建", type: .text) {
            let vc = ZLNewQuestionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        
        view.addSubview(titleLabel)
        view.addSubview(orcBtn)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(autoSize(number: 100))
        }
        orcBtn.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(autoSize(number: 30))
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: autoSize(number: 80), height: autoSize(number: 30)))
        }
        let title: String = "你好啊！"
        
        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.lineSpacing = 10
        style.firstLineHeadIndent = 20.0
        style.alignment = .justified
        style.baseWritingDirection = .leftToRight
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, title.count))
        
//        let image = UIImage(named: "nav_set")
//        let imageAttachment: NSMutableAttributedString = NSMutableAttributedString.yy_attachmentString(withContent: image, contentMode: .center, attachmentSize: image?.size ?? CGSize(width: 40, height: 40), alignTo: autoFont(font: 16), alignment: .center)
//        attributedString.append(imageAttachment)
        
        let textField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: autoSize(number: 20), height: autoSize(number: 20)))
        textField.backgroundColor = UIColor.orange
//        textField.sizeToFit()
        textField.text = "Z"
        
        let attachment = NSMutableAttributedString.yy_attachmentString(withContent: textField, contentMode: .bottom, attachmentSize: textField.size, alignTo: autoFont(font: 16), alignment: .center)
        attributedString.append(attachment)
        
        let righTextAttachment = NSMutableAttributedString(string: "右边的文字")
        attributedString.append(righTextAttachment)
        titleLabel.attributedText = attributedString
    }
    
    // MARK: - View(页面处理)
    
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    lazy var editor: RichEditorView = {
        let temp = RichEditorView()
        return temp
    }()

    lazy var titleLabel: YYLabel = {
        let temp = YYLabel()
        temp.text = ""
        temp.textColor = color_333333
        temp.textAlignment = .left
        temp.font = autoFont(font: 16)
        temp.numberOfLines = 0
        return temp
    }()
    
    lazy var orcBtn: UIButton = {
        let temp = UIButton()
        temp.backgroundColor = color_ffffff
        temp.setTitle("OCR", for: .normal)
        temp.setTitleColor(color_333333, for: .normal)
        temp.titleLabel?.font = autoFont(font: 16)
        temp.rx.controlEvent(.touchUpInside).subscribe { (button) in
            self.generalOCR()
        }.disposed(by: disposeBag)
        return temp
    }()
}
