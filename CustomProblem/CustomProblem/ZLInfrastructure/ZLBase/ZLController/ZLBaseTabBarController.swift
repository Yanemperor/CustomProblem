//
//  ZLBaseTabBarController.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class ZLBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        UITabBar.appearance().tintColor = color_333333
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
}

extension ZLBaseTabBarController {
    fileprivate func setupUI() {
        setupOneChildViewController(title: "答题", image: "tabbar_home", selectedImage: "tabbar_home_selected", controller: ZLHomeViewController())
    }
    
    fileprivate func setupOneChildViewController(title: String, image: String, selectedImage: String, controller: UIViewController) {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        let naviController = ZLBaseNavigationController.init(rootViewController: controller)
        addChild(naviController)
    }
}
