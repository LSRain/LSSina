//
//  LSHomeViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

private let cellHomeStatusesIdentifier = "cellHomeStatusesIdentifier"
class LSHomeViewController: LSVisitorViewController {

    /// 首页微博数据模型数组
    var dataArray:[LSStatusesModel] = [LSStatusesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(tableView.frame)")
        setupUI()
        setupTableView()
    }
    
    func setupUI() -> Void {
        /// 未登录
        if !isLogin {
            /// `首页`传入nil显示特定的访客视图
            visitorView?.setupVisitroViewInfo(imageName: nil, title: nil)
            return
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(leftBarButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendsearch", target: self, action: #selector(rightBarButtonClick))
        
        /// 请求数据
        getStatusesData { (resultArray) in
            self.dataArray = resultArray
            /// 数据请求成功后刷新`tab`数据源
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() -> Void {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHomeStatusesIdentifier)
    }
    
    @objc private func leftBarButtonClick() -> Void {
        print("leftClick")
    }
    
    @objc private func rightBarButtonClick() -> Void {
        let pushVC = LSTempViewController()
        pushVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(pushVC, animated: true)
    }

}

/// `tab`数据源方法相关
extension LSHomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHomeStatusesIdentifier, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row].text
        cell.backgroundColor = LSRandomColor()
        return cell
    }
    
}

/// 网络请求相关extention
extension LSHomeViewController{
    /// 请求首页数据 - 获取当前登录用户及其所关注（授权）用户的最新微博
    fileprivate func getStatusesData(callBack:@escaping ([LSStatusesModel])->()) -> Void {
        let parames = ["access_token": LSUserAccountViewModel.sharedAccount.userAccount?.access_token]
        LSNetworkTools.sharedTools.request(method: .get, URLString: LSFriendURL, parameters: parames, success: { (responseObject) in
            /// 判断是否能够转成字典
            guard let resDic = responseObject as? [String: Any] else{
                return
            }
            /// 判断是否能够转成数组
            guard let resArr = resDic["statuses"] as? [[String: Any]] else{
                return
            }
            let statusesArray = NSArray.yy_modelArray(with: LSStatusesModel.self, json: resArr) as! [LSStatusesModel]
            /// 回调闭包
            callBack(statusesArray)
        }) { (error) in
            print(error)
        }
    }
}
