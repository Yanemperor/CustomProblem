//
//  ZLBaseTableViewController.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ZLBaseTableViewController: ZLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
      
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(kNavigationBarHeight)
            if (navigationController?.viewControllers.count)! <= 1 {
                make.bottom.equalToSuperview().offset(-kTabBarHeight)
            }else{
                make.bottom.equalToSuperview().offset(kEqualToTabBarBottom)
            }
        }
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.rowHeight = kTableViewRowHeight
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        
        extendedLayoutIncludesOpaqueBars = true;
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            automaticallyAdjustsScrollViewInsets = false;
        }
    }
    
    // MARK: - 内部方法
    deinit {
        
    }
    
    func addNextBut(title: String, click: @escaping () -> ()) {        
        view.addSubview(leftBtn)
        leftBtn.setTitle(title, for: .normal)
        leftBtn.snp.makeConstraints { (make) in
            make.height.equalTo(autoSize(number: 50))
            make.bottom.equalToSuperview().offset(autoSize(number: -10))
            make.left.equalToSuperview().offset(autoSize(number: 15))
            make.right.equalToSuperview().offset(autoSize(number: -15))
        }
        leftBtn.rx.controlEvent(.touchUpInside).subscribe { (button) in
            click()
        }.disposed(by: disposeBag)
        
        tableView.snp.remakeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(kNavigationBarHeight)
            make.bottom.equalTo(leftBtn.snp.top)
        }
    }
    
    lazy var leftBtn: UIButton = {
        let temp = UIButton()
        temp.backgroundColor = color_ffffff
        temp.setTitle("", for: .normal)
        temp.setTitleColor(color_333333, for: .normal)
        temp.titleLabel?.font = autoFont(font: 16)
        temp.layer.cornerRadius = autoSize(number: 50 / 2.0)
        temp.layer.masksToBounds = true
        temp.layer.borderWidth = 1
        temp.layer.borderColor = color_333333.cgColor
        return temp
    }()
    
    
    // MARK: - 懒加载
    
    lazy var bannerView: ZLBannerView = {
        let temp = ZLBannerView()
        return temp
    }()
    
    lazy var tableView: UITableView = {
        let tempTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
        tempTableView.backgroundColor = color_f9f9f9
        tempTableView.dataSource = self
        tempTableView.delegate = self
        return tempTableView
    }()
}

extension ZLBaseTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return autoSize(number: 10.0)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return kCGFloat_min
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bgView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: autoSize(number: 10.0)))
        bgView.backgroundColor = color_f6f6f6
        return bgView;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let bgView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kCGFloat_min))
        return bgView
    }
    
    func setDataSource() {
        tableView.dataSource = nil
    }
    
}

