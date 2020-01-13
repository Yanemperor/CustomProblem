//
//  ZLProblemViewController.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/12/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class ZLProblemViewController: ZLBaseTableViewController {

    var multipleChoice: Array<ZLTitleModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initUI()
    }
    
    func initUI() {
        navTitle(title: "")
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(kNavigationBarHeight)
            make.bottom.equalToSuperview()
        }
        extendedLayoutIncludesOpaqueBars = true;
        if #available(iOS 11.0, *) {
            mainView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        }
    }
    
    func initData() {
//        vm.dataList = multipleChoice

    }
    
    // MARK: - View(页面处理)
    
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    lazy var mainView: UICollectionView = {
        let temp = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        temp.backgroundColor = UIColor.white
        temp.isPagingEnabled = true
        temp.showsVerticalScrollIndicator = false
        temp.showsHorizontalScrollIndicator = false
        temp.register(ZLProblemCollectionViewCell.self, forCellWithReuseIdentifier: "ZLProblemCollectionViewCell")
        temp.dataSource = self
        temp.delegate = self
        temp.scrollsToTop = false;
        return temp
    }()

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let temp = UICollectionViewFlowLayout()
        temp.itemSize = CGSize(width: kScreenWidth, height: kScreenHeight - kNavigationBarHeight - 70)
        temp.minimumLineSpacing = 0
        temp.scrollDirection = .horizontal
        return temp
    }()
    
    lazy var vm: ZLProblemViewModel = ZLProblemViewModel()

}

extension ZLProblemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ZLProblemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZLProblemCollectionViewCell", for: indexPath) as! ZLProblemCollectionViewCell
//        cell.setTitleModel(titleModel: vm.dataList?[indexPath.row] ?? ZLTitleModel())
        cell.titleModel = vm.dataList[indexPath.row]
        return cell
    }
}

