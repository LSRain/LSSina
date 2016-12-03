//
//  Extension+UILable.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

extension UILabel{
    
    /// 快速构建Lable
    ///
    /// - Parameters:
    ///   - text: Labeltext
    ///   - fontSize: fontSize
    ///   - textColor: textColor
    convenience init(text: String, fontSize: CGFloat, textColor: UIColor) {
        self.init()
        self.text = text
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
    }
}
