//
//  LSStatusViewModel.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/8.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

/// `view级别`的viweModel - 管理模型
class LSStatusViewModel: NSObject {
    
    var statusModel: LSStatusesModel?{
        didSet{
            mbRankImage = dealMbrankImage(mbrank: statusModel?.user?.mbrank ?? 0)
            verifiedImage = dealVerified(verified: statusModel?.user?.verified ?? -1)
        }
    }
    /// 等级视图
    var mbRankImage: UIImage?
    /// 认证视图
    var verifiedImage: UIImage?
}

/// 处理视图逻辑 extension
extension LSStatusViewModel{

    /// 会员认证处理
    ///
    /// - Parameter verified: 认证类型 -1：没有认证，1：认证用户，2,3,5: 企业认证，220: 达人
    /// - Returns: 判断后的认证图标
    func dealVerified(verified: Int) -> UIImage? {
        switch verified {
        case 1:
            return UIImage(named: "avatar_vip")
        case 2, 3, 5:
            return UIImage(named: "avatar_enterprise_vip")
        case 220:
            return UIImage(named: "avatar_grassroot")
        default:
            return UIImage(named: "avatar_vgirl")
        }
    }
    
    /// 会员等级处理
    ///
    /// - Parameter mbrank: 等级Int
    /// - Returns: 判断后的等级图标
    func dealMbrankImage(mbrank: Int) -> UIImage?{
        
        /// 等级在1-6之间
        if mbrank > 0 && mbrank < 7 {
            return UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        
        return UIImage(named: "common_icon_membership")
    }
}
