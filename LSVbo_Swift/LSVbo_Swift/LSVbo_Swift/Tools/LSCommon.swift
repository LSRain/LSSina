//
//  LSCommon.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

/// 微博相关
/// OAuthURL
let LSOAuthURL = "https://api.weibo.com/oauth2/authorize"
/// AppKey
let LSClient_id = "2733381210"
/// 应用回调地址
let LSRedirect = "http://www.lsrain.com"
/// 账号和密码 - 这里没有给出具体的账号密码 使用时 您可以将自己的账号和密码在这里设置
let LSWBUserId = "test@test.com"
let LSWBPasswd = "Test"

/// 屏幕尺寸相关
let LSWidth = UIScreen.main.bounds.width
let LSHeight = UIScreen.main.bounds.height

/// 颜色相关
let LSThemeColor = UIColor.orange

/// 字体相关
let LSFontBigSize: CGFloat = 18
let LSFontNormalSize: CGFloat = 14
let LSFontSmallSize: CGFloat = 10

/// 随机颜色
func LSRandomColor () -> UIColor{
    let r = (CGFloat)(arc4random() % 256)
    let g = (CGFloat)(arc4random() % 256)
    let b = (CGFloat)(arc4random() % 256)
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}
