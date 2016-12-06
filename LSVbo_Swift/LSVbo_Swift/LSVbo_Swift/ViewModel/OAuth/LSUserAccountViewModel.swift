//
//  LSUserAccountViewModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/5.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit
import YYModel

/// 自定义类 - 没有继承 `NSObject`
class LSUserAccountViewModel{

    static let sharedAccount: LSUserAccountViewModel = LSUserAccountViewModel()
    var userAccount: LSUserAccountModel?
    
    /// 单独定义的`token` - 访问令牌 用以标记是否过期
    var access_token: String?{
        if userAccount?.expires_Date?.compare(Date()) == ComparisonResult.orderedDescending {
            /// 降序 - 说明没有过期
            return userAccount?.access_token
        } else{
            /// 过期/没有登录 - 置为`nil`
            return nil
        }
    }
    /// 用户登录标记
    var isLogin: Bool{
        return access_token != nil
    }
    
    /// 防止频繁调用沙盒影响性能 - 重写`init`
    init() {
        userAccount = getAccountModel()
    }
    
    /// 沙盒路径
    let file = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archiver")
    
    /// 保存对象
    func saveAccountModel(model: LSUserAccountModel) -> Void {
        userAccount = model
        NSKeyedArchiver.archiveRootObject(model, toFile: file)
    }
    
    /// 获取对象
    private func getAccountModel()->LSUserAccountModel?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: file) as? LSUserAccountModel
    }
}

/// 帮助VC处理网络请求
extension LSUserAccountViewModel{
    
    /// 获取用户`token`
    ///
    /// - Parameters:
    ///   - code: code
    ///   - finish: 成功标记闭包
    func getUserAccount(code: String, finish:@escaping (Bool)->()) -> Void {
        LSNetworkTools.sharedTools.oauthLoadUserAccount(code: code, success: { (responseObject) in
            guard let res = responseObject as?[String: Any] else{
                finish(false)
                return
            }
            let userAccountModel = LSUserAccountModel.yy_model(withJSON: res)
            guard let model = userAccountModel else{
                finish(false)
                return
            }
            self.getUserInfo(userModel: model, finish: finish)
        }) { (error) in
            print("\(error)")
            finish(false)
        }
    }
    
    /// 请求用户信息
    ///
    /// - Parameters:
    ///   - userModel: 用户模型
    ///   - finish: 成功标记闭包
    func getUserInfo(userModel: LSUserAccountModel, finish:@escaping (Bool)->()) -> Void {
        LSNetworkTools.sharedTools.oauthLoadUserInfo(userModel: userModel, success: { (responseObject) in
            guard let res = responseObject as?[String: Any] else{
                finish(false)
                return
            }
            userModel.screen_name = res["screen_name"] as? String
            userModel.profile_image_url = res["profile_image_url"] as? String
            self.saveAccountModel(model: userModel)
            /// 用户信息获取到才标识成功
            finish(true)
        }) { (error) in
            print("\(error)")
            finish(false)
        }
    }
}
