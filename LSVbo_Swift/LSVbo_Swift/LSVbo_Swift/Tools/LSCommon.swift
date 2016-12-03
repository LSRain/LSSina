//
//  LSCommon.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

/// 屏幕尺寸相关
let LSWidth = UIScreen.main.bounds.width
let LSHeight = UIScreen.main.bounds.height

/// 颜色相关
let LSThemeColor = UIColor.orange

/// 随机颜色
func LSRandomColor () -> UIColor{
    let r = (CGFloat)(arc4random() % 256)
    let g = (CGFloat)(arc4random() % 256)
    let b = (CGFloat)(arc4random() % 256)
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}
