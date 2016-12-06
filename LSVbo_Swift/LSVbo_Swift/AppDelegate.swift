//
//  AppDelegate.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        setupRootVC()
        NotificationCenter.default.addObserver(self, selector: #selector(switchRootViewController(noti:)), name: NSNotification.Name(rawValue: LSSWITCHROOTVCNOTI), object: nil)
        window?.makeKeyAndVisible()
        return true
    }
    
    /// 设置根控制器
    /// - 用户已经授权过登录 则启动时rootVC为`LSWellcomeViewController`
    func setupRootVC() -> Void {
        if LSUserAccountViewModel.sharedAccount.isLogin {
            window?.rootViewController = LSWellcomeViewController()
            return
        }
        window?.rootViewController = LSMainViewController()
    }
    
    /// 切换根控制器
    ///
    /// - Parameter noti: 通知参数 - `nil`: 授权后通知 - `welcom`: 欢迎页加载完成后通知
    func switchRootViewController(noti: Notification){
        if noti.object == nil {
            /// 说明是授权完成通知
            window?.rootViewController = LSWellcomeViewController()
        }else{
            /// 首页加载完成通知 - 附带参数
            window?.rootViewController = LSMainViewController()
        }
    }
    
    /// 析构函数 - 销毁通知 `谁接收 谁销毁`
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

