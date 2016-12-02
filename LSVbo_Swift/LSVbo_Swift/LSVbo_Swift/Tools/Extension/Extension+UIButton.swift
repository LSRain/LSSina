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
    
    /// 快速构造一个UIButton - 项目中用于撰写按钮的构建
    ///
    /// - Parameters:
    ///   - imageName: 图片名
    ///   - backgroundImageName: 背景图片名
    ///   - target: target
    ///   - action: action
    convenience init(imageName: String, backgroundImageName: String, target: Any?, action: Selector) {
        self.init()
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.setImage(UIImage(named: imageName), for: UIControlState.normal)
        self.setImage(UIImage(named: "\(imageName)_highlighted"), for: UIControlState.highlighted)
        self.setBackgroundImage(UIImage(named: backgroundImageName), for: UIControlState.normal)
        self.setBackgroundImage(UIImage(named: "\(backgroundImageName)_highlighted"), for: UIControlState.highlighted)
        self.sizeToFit()
    }
    
    
    /// 快速构造一个UIButton - 项目中用于导航栏按钮的构建
    ///
    /// - Parameters:
    ///   - imageName: 图片名
    ///   - target: target
    ///   - action: action
    convenience init(imageName: String, target: Any?, action: Selector) {
        self.init()
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.setImage(UIImage(named: imageName), for: UIControlState.normal)
        self.setImage(UIImage(named: "\(imageName)_highlighted"), for: UIControlState.highlighted)
        self.sizeToFit()
    }
}
