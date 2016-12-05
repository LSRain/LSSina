//
//  LSUserAccountModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/4.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSUserAccountModel: NSObject, NSCoding {

    /// 用户授权的唯一票据
    var access_token: String?
    /// 生命周期 单位是s
    var expires_in: TimeInterval = 0{
        didSet{
            /// 当前日期s + 过期秒数 = 将要过期的日期
            expires_Date = Date().addingTimeInterval(expires_in)
        }
    }
    /// 授权用户的UID
    var uid: String?
    
    /// UserInfo
    /// 用户昵称
    var screen_name: String?
    /// 用户头像地址（中图）50×50像素
    var profile_image_url: String?
    
    /// 将授权有效日期转换等Date类型
    var expires_Date: Date?
    
    override init() {
        super.init()
    }
    
    override var description: String{
        let keys = [
            "access_token",
            "expires_Date",
            "uid",
            "screen_name",
            "profile_image_url"
        ]
        return dictionaryWithValues(forKeys: keys).description
    }
    
    /// 使用`YYModel`实现归档/解档
    /// 归档
    func encode(with aCoder: NSCoder) {
        self.yy_modelEncode(with: aCoder)
    }
    
    /// 解档
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.yy_modelInit(with: aDecoder)
    }
}
