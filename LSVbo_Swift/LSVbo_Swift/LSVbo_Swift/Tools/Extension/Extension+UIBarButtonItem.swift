//
//  Extension+UIBarButtonItem.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    
    /// 快速构建一个`UIBarButtonItem`
    ///
    /// - Parameters:
    ///   - imageName: 图片名
    ///   - target: target
    ///   - action: action
    convenience init(imageName: String? = nil,title: String? = nil, target: Any?, action: Selector) {
        self.init()
        
        let btn = UIButton(imageName: imageName,title: title, target: target, action: action)
        self.customView = btn
    }
}
