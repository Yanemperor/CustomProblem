//
//  UITextField+Extension.swift
//  WhatEat
//
//  Created by 周子龙 on 2019/12/25.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setPlaceholderFont(font: Float) {
        self.setValue(autoFont(font: 15), forKeyPath: "_placeholderLabel.font")
    }
    
    func setPlaceholderColor(color: UIColor) {
        self.setValue(color, forKeyPath: "_placeholderLabel.textColor")
    }
    
    func setPlaceholder(font: Float, color: UIColor) {
        self.setValue(autoFont(font: 15), forKeyPath: "_placeholderLabel.font")
        self.setValue(color, forKeyPath: "_placeholderLabel.textColor")
    }
}
