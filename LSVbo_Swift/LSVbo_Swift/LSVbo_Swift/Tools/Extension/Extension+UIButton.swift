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
    convenience init(imageName: String, backgroundImageName: String, target: Any?, action: Selector) {
        self.init()
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.setImage(UIImage(named: imageName), for: UIControlState.normal)
        self.setImage(UIImage(named: "\(imageName)_highlighted"), for: UIControlState.highlighted)
        self.setBackgroundImage(UIImage(named: backgroundImageName), for: UIControlState.normal)
        self.setBackgroundImage(UIImage(named: "\(backgroundImageName)_highlighted"), for: UIControlState.highlighted)
        self.sizeToFit()
    }
}
