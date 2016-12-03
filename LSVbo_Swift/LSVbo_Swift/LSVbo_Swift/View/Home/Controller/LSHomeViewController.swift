//
//  LSHomeViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSHomeViewController: LSVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() -> Void {
        /// 未登录
        if !isLogin {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(leftBarButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendsearch", target: self, action: #selector(rightBarButtonClick))
        /// `首页`传入nil显示特定的访客视图
        visitorView?.setupVisitroViewInfo(imageName: nil, title: nil)
            return
        }
        loadData()
    }
    
    /// 数据请求
    private func loadData(){
        
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
