//
//  LSStatusesModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/6.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSStatusesModel: NSObject {

    /// 创建时间
    var created_at: String?
    /// 微博ID
    var id: Int = 0
    /// 微博信息内容
    var text: String?
    /// 微博来源
    var source: String?
    /// 用户模型
    var user: LSUserModel?
    
    /// 转发微博 - 和tatuses平级
    var retweeted_status: LSStatusesModel?
    
    override var description: String{
        let keys = [
            "created_at",
            "id",
            "text",
            "source",
            "user"
        ]
        return dictionaryWithValues(forKeys: keys).description
    }
}
