//
//  LSNetworkTools.swift
//  LSNetwork_Swift
//
//  Created by WangBiao on 2016/12/4.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit
import AFNetworking


/// 请求方式ENUM
///
/// - get: GET请求
/// - post: POST请求
enum LSNetworkToolsMethod: String{
    case get = "GET"
    case post = "POST"
}

class LSNetworkTools: AFHTTPSessionManager {

    /// 单例访问点
    static let sharedTools: LSNetworkTools = {
       
        let tool = LSNetworkTools()
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    
    /// 网络请求主入口
    ///
    /// - Parameters:
    ///   - method: 请求方式 - `.get`/`.post`
    ///   - URLString: URL
    ///   - parameters: 请求参数
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func request(method: LSNetworkToolsMethod, URLString: String, parameters: Any?, success:@escaping (Any?)->(), failure:@escaping (Error)->()) -> Void {
        if method == .get {
            self.get(URLString, parameters: parameters, progress: nil, success: { (_, responseObject) in
                success(responseObject)
            }, failure: { (_, error) in
                failure(error)
            })
            return
        }
        /// POST
        self.post(URLString, parameters: parameters, progress: nil, success: { (_, responseObject) in
            success(responseObject)
        }, failure: { (_, error) in
            failure(error)
        })
    }
}

/// 首页数据请求相关接口
extension LSNetworkTools{

    func loadHomeData(success:@escaping (Any?)->(), failure:@escaping (Error)->()) -> Void {
        let parames = ["access_token": LSUserAccountViewModel.sharedAccount.userAccount?.access_token]
        request(method: .get, URLString: LSFriendURL, parameters: parames, success: success, failure: failure)
    }
}

/// OAuth相关接口
extension LSNetworkTools{
    
    /// OAuth加载`token`接口
    ///
    /// - Parameters:
    ///   - code: code
    ///   - success: 成功的回调
    ///   - failure: 失败的回调
    func oauthLoadUserAccount(code: String, success:@escaping (Any?)->(), failure:@escaping (Error)->()){
        let parames = [
            "client_id": LSClient_id,
            "client_secret": LSClient_secret,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": LSRedirect
        ]
        request(method: .post, URLString: LSTokenURL, parameters: parames, success: success, failure: failure)
    }
    
    /// OAuth加载用户信息接口
    ///
    /// - Parameters:
    ///   - userModel: 用户模型
    ///   - success: 成功的回调
    ///   - failure: 失败的回调
    func oauthLoadUserInfo(userModel: LSUserAccountModel, success:@escaping (Any?)->(), failure:@escaping (Error)->()){
        let parames = [
            "access_token": userModel.access_token,
            "uid": userModel.uid
        ]
        request(method: .get, URLString: LSUserInfoURL, parameters: parames, success: success, failure: failure)
    }
}
