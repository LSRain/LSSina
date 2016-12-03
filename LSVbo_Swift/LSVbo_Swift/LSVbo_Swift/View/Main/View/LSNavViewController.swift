//
//  LSNavViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSNavViewController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() -> Void {
        /// 使用自定义Nav控制器会导致`7.0`后的侧滑边缘侧滑效果失效，需要自己指定代理
        interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        /// 即： 只有在手动点击`PUSH`创建出的子控制器时才让手势侧滑生效
        return childViewControllers.count > 1
    }

    /// 重写父类的`pushViewController`
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.navigationItem.title = "第\(childViewControllers.count)个控制器"
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "PUSH", target: self, action: #selector(pushClick))
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_back_withtext", title: "返回", target: self, action: #selector(leftBtnClick))
            /// 第一次`push`后的返回按钮显示的是`上一个nav的title`
            if childViewControllers.count == 1 {
                viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_back_withtext", title: childViewControllers.first?.title, target: self, action: #selector(leftBtnClick))
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    /// 使用自定义NavigationController后需要制定其返回按钮的`pop`操作
    func leftBtnClick() -> Void {
        popViewController(animated: true)
        
    }
    
    func pushClick(){
        pushViewController(LSTempViewController(), animated: true)
    }
}
