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

/// 其他接口extension
extension LSNetworkTools{

    /// 天气请求接口
    ///
    /// - Parameters:
    ///   - cityName: 城市名称
    ///   - success: 请求成功回调
    ///   - failure: 失败回调
    func loadWeather(cityName: String, success:@escaping (Any?)->(), failure:@escaping (Error)->()) -> Void {
        
        /// 假设 需传递的参数为城市名称
        let dic = ["CityName": cityName]
        request(method: .get, URLString: "http://www.weather.com.cn/data/sk/101010100.html", parameters: dic, success: { (resposeObject) in
            success(resposeObject)
        }) { (error) in
            failure(error)
        }
    }
}
