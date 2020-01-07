//
//  BaseTableViewCell.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/9.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(autoSize(number: 15))
            make.right.equalToSuperview().offset(autoSize(number: -15))
            make.bottom.equalToSuperview()
            make.height.equalTo(autoSize(number: 0.5))
        }
    }
    
    lazy var bottomLine: UIView = {
        let temp = UIView()
        temp.backgroundColor = color_ebebeb
        return temp
    }()
    
    required init?(coder aDecoder: NSCoder) {
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
