//
//  LSUserAccountViewModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/5.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSUserAccountViewModel: NSObject{

    static let sharedAccount: LSUserAccountViewModel = LSUserAccountViewModel()
    /// 沙盒路径
    let file = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archiver")
    
    /// 保存对象
    func saveAccountModel(model: LSUserAccountModel) -> Void {
        NSKeyedArchiver.archiveRootObject(model, toFile: file)
    }
    
    /// 获取对象
    func getAccountModel()->LSUserAccountModel?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: file) as? LSUserAccountModel
    }
    
   
}
