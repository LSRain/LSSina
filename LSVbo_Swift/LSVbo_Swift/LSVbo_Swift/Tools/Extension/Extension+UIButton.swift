//
//  Extension+UIButton.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

extension UIButton{
    
    /// `convenience`便利构造器
    
    /// 快速构造一个UIButton
    ///
    /// - Parameters:
    ///   - imageName: 图片名
    ///   - backgroundImageName: 背景图片名
    ///   - title: 按钮文字
    ///   - target: target
    ///   - action: action
    convenience init(imageName: String? = nil, backgroundImageName: String? = nil, title: String? = nil, target: Any?, action: Selector) {
        self.init()
        if let img = imageName{
            self.setImage(UIImage(named: img), for: UIControlState.normal)
            self.setImage(UIImage(named: "\(img)_highlighted"), for: UIControlState.highlighted)
        }
        if let backimg = backgroundImageName{
            self.setBackgroundImage(UIImage(named: backimg), for: UIControlState.normal)
            self.setBackgroundImage(UIImage(named: "\(backimg)_highlighted"), for: UIControlState.highlighted)
        }
        if let ltitle = title{
            self.setTitle(ltitle, for: UIControlState.normal)
            self.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
            self.setTitleColor(LSThemeColor, for: UIControlState.highlighted)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
        }
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.sizeToFit()
    }
}
