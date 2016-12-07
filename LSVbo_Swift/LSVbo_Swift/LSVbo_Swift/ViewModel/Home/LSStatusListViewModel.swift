//
//  LSStatusListViewModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/8.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSStatusListViewModel: NSObject {
    /// 首页微博数据模型数组
    var dataArray:[LSStatusesModel] = [LSStatusesModel]()
}

/// 首页处理网络数据接口
extension LSStatusListViewModel{

    /// 请求首页数据 - 获取当前登录用户及其所关注（授权）用户的最新微博
    func loadHomdData(finish:@escaping (Bool)->()) -> Void {
        
        LSNetworkTools.sharedTools.loadHomeData(success: { (responseObject) in
            /// 判断是否能够转成字典
            guard let resDic = responseObject as? [String: Any] else{
                finish(false)
                return
            }
            /// 判断是否能够转成数组
            guard let resArr = resDic["statuses"] as? [[String: Any]] else{
                finish(false)
                return
            }
            
            let statusesArray = NSArray.yy_modelArray(with: LSStatusesModel.self, json: resArr) as! [LSStatusesModel]
            self.dataArray = statusesArray
            finish(true)
        }, failure: { (error) in
            print(error)
            finish(false)
        })
    }
}
