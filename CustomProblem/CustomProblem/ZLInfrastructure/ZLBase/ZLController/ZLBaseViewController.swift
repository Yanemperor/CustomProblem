//
//  ZLBaseViewController.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ZLBaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isTranslucent = false
//        automaticallyAdjustsScrollViewInsets = true
        
        view.backgroundColor = UIColor.white
        setupNormalNavigationBar()
        setHideenTabbar()
    }
    
    func setupNormalNavigationBar() {
        if (navigationController?.viewControllers.count)! <= 1 {
            navigationItem.leftBarButtonItem = nil
        }else{
            addBackBtn()
        }
    }
    
    
    func addBackBtn(){
        let leftBtn: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back"), style: .plain, target: self, action: #selector(actionBack))
        leftBtn.tintColor = color_333333
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    
    func setHideenTabbar() {
        tabBarController?.tabBar.isHidden = true
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ZLGlobalTimer.shared.waitingClick()
    }
    
    
    //返回按钮事件
    
    @objc func actionBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
}

// MARK: - 设置导航栏右侧按钮
extension ZLBaseViewController {
    
    func setRightBarButtonItem(name: String, type: BarButtonItemType, click: @escaping () -> ())  {
        let rightButton = setRightBarButtonButton(name: name, textColor: nil, type: type, click: click)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    func setRightBarButtonItem(name: String, textColor: UIColor, type: BarButtonItemType, click: @escaping () -> ())  {
        let rightButton = setRightBarButtonButton(name: name, textColor: textColor, type: type, click: click)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    func setNavigationItemRightBarButtonItem(name: String, type: BarButtonItemType, click: @escaping () -> ())  {
        let rightButton = setRightBarButtonButton(name: name, textColor: nil, type: type, click: click)
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    func setNavigationItemRightBarButtonItem(name: String, textColor: UIColor, type: BarButtonItemType, click: @escaping () -> ())  {
        let rightButton = setRightBarButtonButton(name: name, textColor: textColor, type: type, click: click)
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    
    func setRightBarButtonButton(name: String, textColor: UIColor?, type: BarButtonItemType, click: @escaping () -> ()) -> UIButton {
        let rightButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: autoSize(number: 40), height: autoSize(number: 40)))
        switch type {
        case .text:
            rightButton.setTitle(name, for: .normal)
            rightButton.setTitleColor(textColor ?? UIColor.orange, for: .normal)
        case .image:
            rightButton.setImage(UIImage(named: name), for: .normal)
        }
        rightButton.rx.controlEvent(.touchUpInside).subscribe { (button) in
            click()
            }.disposed(by: disposeBag)
        return rightButton
    }
}

extension ZLBaseViewController {
    func navTitle(title: String) {
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        titleLabel.text = title
        titleLabel.textColor = color_333333
        titleLabel.textAlignment = .center
        titleLabel.font = autoFont(font: 17)
        titleLabel.adjustsFontSizeToFitWidth = true
        navigationItem.titleView = titleLabel
    }
    
    func navButton(title: String, click: @escaping ()->()) -> UIButton {
        let titleButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        titleButton.setTitle(title, for: .normal)
        titleButton.setTitleColor(color_333333, for: .normal)
        titleButton.titleLabel?.font = autoFont(font: 17)
        titleButton.titleLabel?.adjustsFontSizeToFitWidth = true
        titleButton.setImage(UIImage(named: "nav_drop_down"), for: .normal)
        titleButton.semanticContentAttribute = .forceRightToLeft
        titleButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { (button) in
            click()
        }).disposed(by: disposeBag)
        navigationItem.titleView = titleButton
        return titleButton
    }
}
