//
//  LSUserAccountModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/4.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSUserAccountModel: NSObject {

    /// 用户授权的唯一票据
    var access_token: String?
    /// 生命周期 单位是s
    var expires_in: String?
    /// 授权用户的UID
    var uid: String?
    
    /// UserInfo
    /// 用户昵称
    var screen_name: String?
    /// 用户头像地址（中图）50×50像素
    var profile_image_url: String?
    
    override var description: String{
        let keys = [
            "access_token",
            "expires_in",
            "uid",
            "screen_name",
            "profile_image_url"
        ]
        return dictionaryWithValues(forKeys: keys).description
    }
}
