//
//  ZLProblemTitleCell.swift
//  QuestionBank
//
//  Created by 周子龙 on 2020/1/3.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit

class ZLProblemTitleCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    func initUI() {
        contentView.addSubview(leftView)
        contentView.addSubview(titleLabel)
        leftView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(autoSize(number: 15))
            make.width.equalTo(autoSize(number: 5))
            make.height.equalTo(titleLabel.snp.height)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftView.snp.right).offset(autoSize(number: 3))
            make.top.equalToSuperview().offset(autoSize(number: 10))
            make.bottom.equalToSuperview().offset(autoSize(number: -10))
        }
    }
    
    lazy var leftView: UIView = {
        let temp = UIView()
        temp.backgroundColor = color_FFA500
        return temp
    }()
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.text = "选择题"
        temp.textColor = color_333333
        temp.textAlignment = .left
        temp.font = autoFont(font: 16)
        return temp
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
