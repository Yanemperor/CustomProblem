//
//  ZLKeyboardToolbar.swift
//  CustomProblem
//
//  Created by 周子龙 on 2020/1/8.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit
import YYText
import SwiftyJSON

class ZLKeyboardToolbar: UIView {

    typealias TextBlock = (String) -> ()
    
    var textBlock: TextBlock?

    
    init() {
        super.init(frame: CGRect.zero)
        initUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    func initUI() {
        self.backgroundColor = color_ffffff
        self.origin = CGPoint(x: 0, y: kScreenHeight)
        self.size = CGSize(width: kScreenWidth, height: autoSize(number: 160 + 200))
        addSubview(textView)
        addSubview(toolbarView)
        addSubview(bottomView)
        bottomView.addSubview(recordBtn)
        textView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(autoSize(number: 10))
            make.left.equalToSuperview().offset(autoSize(number: 15))
            make.right.equalToSuperview().offset(autoSize(number: -15))
            make.height.equalTo(autoSize(number: 100))
        }
        toolbarView.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(autoSize(number: 10))
            make.left.equalToSuperview().offset(autoSize(number: 0))
            make.right.equalToSuperview().offset(autoSize(number: 0))
            make.height.equalTo(autoSize(number: 40))
        }
        bottomView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(autoSize(number: 0))
            make.right.equalToSuperview().offset(autoSize(number: 0))
            make.top.equalTo(toolbarView.snp.bottom).offset(autoSize(number: 0))
            make.bottom.equalToSuperview().offset(autoSize(number: 0))
        }
        recordBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: autoSize(number: 100), height: autoSize(number: 100)))
        }
    }
    
    lazy var iFlySpeechRecognizer: IFlySpeechRecognizer = {
        let temp = IFlySpeechRecognizer.sharedInstance()
        temp?.setParameter("iat", forKey: IFlySpeechConstant.ifly_DOMAIN())
        temp?.setParameter("iat.pcm", forKey: IFlySpeechConstant.asr_AUDIO_PATH())
        temp?.startListening()
        temp?.delegate = self
        return temp!
    }()
    
    lazy var textView: YYTextView = {
        let temp = YYTextView()
        temp.backgroundColor = color_ffffff
        temp.textAlignment = .left
        temp.textColor = color_666666
        temp.font = autoFont(font: 16)
        temp.placeholderText = "请输入"
        temp.placeholderFont = autoFont(font: 16)
        temp.layer.cornerRadius = 5
        temp.layer.masksToBounds = true
        return temp
    }()
    
    lazy var toolbarView: ZLToolbarView = {
        let temp = ZLToolbarView()
        temp.backgroundColor = color_F5F5F5
        temp.textBlock = { text in
            self.textView.text = text
            self.textView.becomeFirstResponder()
        }
        temp.voiceBlock = { text in
            self.textView.resignFirstResponder()
        }
        temp.hidKeyboardBlock = { text in
            self.textView.resignFirstResponder()
            self.origin = CGPoint(x: 0, y: kScreenHeight)
            if self.textBlock != nil {
                self.textBlock!(self.textView.text)
            }
        }
        return temp
    }()
    
    lazy var recordBtn: UIButton = {
        let temp = UIButton()
        temp.backgroundColor = color_ffffff
//        temp.setImage(UIImage(named: "record_normal"), for: .normal)
//        temp.setImage(UIImage(named: "record_highlighted"), for: .highlighted)
        temp.setBackgroundImage(UIImage(named: "record_normal"), for: .normal)
        temp.setBackgroundImage(UIImage(named: "record_highlighted"), for: .highlighted)

        temp.addTarget(self, action: #selector(recordBtnLongPress), for: .touchDown)
        return temp
    }()
    
    @objc func recordBtnLongPress() {
        iFlySpeechRecognizer.startListening()
    }
    
    lazy var bottomView: UIView = {
        let temp = UIView()
        temp.backgroundColor = color_ffffff
        return temp
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZLKeyboardToolbar: IFlySpeechRecognizerDelegate {
    func onCompleted(_ errorCode: IFlySpeechError!) {
        
    }
    
    func onResults(_ results: [Any]!, isLast: Bool) {
        let json = JSON(results!)
        var allString: String = ""
        let dic: Dictionary = json[0].dictionaryValue
        let array: Array = Array(dic.keys)
        let newDic: Dictionary = ZLJSONParser.shared.stringValueDic(array[0]) ?? ["":""]
        let newJson = JSON(newDic)
        for item in newJson["ws"].arrayValue {
            allString = allString + item["cw"][0]["w"].stringValue
        }
        print(allString)
        textView.text = textView.text + allString
    }
    
}
