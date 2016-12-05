//
//  LSUserAccountViewModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/5.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

/// 自定义类 - 没有继承 `NSObject`
class LSUserAccountViewModel{

    static let sharedAccount: LSUserAccountViewModel = LSUserAccountViewModel()
    var userAccount: LSUserAccountModel?
    
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
