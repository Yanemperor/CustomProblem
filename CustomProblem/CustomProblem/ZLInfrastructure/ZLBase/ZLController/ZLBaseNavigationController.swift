//
//  ZLBaseNavigationController.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class ZLBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()

        // Do any additional setup after loading the view.
    }
    
    func setNavBar() {
        // 移除导航栏的线
        navigationBar.shadowImage = UIImage()
        let image = UIColor.white.getImageByRect(rect: CGRect(x: 0, y: 0, width: navigationBar.width, height: navigationBar.height))
        navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.layer.shadowOpacity = 0.05
        navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationBar.layer.shadowRadius = autoSize(number: 2.5)
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: autoSize(number: 2.5))
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
