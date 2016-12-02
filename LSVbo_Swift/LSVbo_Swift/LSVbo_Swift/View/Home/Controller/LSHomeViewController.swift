//
//  LSHomeViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSHomeViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() -> Void {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(leftBarButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendsearch", target: self, action: #selector(rightBarButtonClick))
    }
    
    @objc private func leftBarButtonClick() -> Void {
        print("leftClick")
    }
    
    @objc private func rightBarButtonClick() -> Void {
        print("rightClick")
    }

}
