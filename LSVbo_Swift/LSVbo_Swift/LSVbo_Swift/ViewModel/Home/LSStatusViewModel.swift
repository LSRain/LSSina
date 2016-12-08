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
        }
    }
    var mbRankImage: UIImage?
}

/// 处理等级视图 extension
extension LSStatusViewModel{
    func dealMbrankImage(mbrank: Int) -> UIImage?{
        
        /// 等级在1-6之间
        if mbrank > 0 && mbrank < 7 {
            return UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        
        return UIImage(named: "common_icon_membership")
    }
}
