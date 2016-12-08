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

    /// 委托`viewModel`处理网络数据 - 请求和保存
    let lsStatusListViewModel = LSStatusListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableViewInfo()
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
        getStatusesData()
    }
    
    @objc private func leftBarButtonClick() -> Void {
        print("leftClick")
    }
    
    @objc private func rightBarButtonClick() -> Void {
        let pushVC = LSTempViewController()
        pushVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(pushVC, animated: true)
    }
    
    /// `tab`相关信息设置
    func setupTableViewInfo() -> Void {
        tableView.dataSource = self
        tableView.register(LSHomeTableViewCell.self, forCellReuseIdentifier: cellHomeStatusesIdentifier)
        /// cell使用预估行高
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }
}

/// `tab`数据源方法相关
extension LSHomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lsStatusListViewModel.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHomeStatusesIdentifier, for: indexPath) as! LSHomeTableViewCell
        cell.statusViewModel = lsStatusListViewModel.dataArray[indexPath.row]
        return cell
    }
}

/// 网络请求相关extention
extension LSHomeViewController{
    /// 请求首页数据 - 获取当前登录用户及其所关注（授权）用户的最新微博
    fileprivate func getStatusesData() -> Void {
        lsStatusListViewModel.loadHomdData { (isSuccess) in
            if !isSuccess{
                print("数据请求失败！请检查网络配置")
                return
            }
            self.tableView.reloadData()
        }
    }
}
