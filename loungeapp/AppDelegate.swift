//
//  AppDelegate.swift
//  loungeapp
//
//  Created by 福島達也 on 2016/07/08.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit
import NCMB


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    //********** APIキーの設定 **********
    let applicationkey = "415848c8e72bf7e05191499e7fa639d051951bed986890e5e27f7d845fcf2f45"
    let clientkey      = "402ca98265c466dd1a3e5a3271ae13bf286d6ba3ab8a8d81f51b1c33d3c4c956"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //********** SDKの初期化 **********
        NCMB.setApplicationKey(applicationkey, clientKey: clientkey)
        //▼▼▼起動時に処理される▼▼▼
    //********** データストアにデータを保存 **********
    let query = NCMBQuery(className: "TestClass")
    query.whereKey("message", equalTo: "Hello, NCMB!")
    query.findObjectsInBackgroundWithBlock{(objects, error) in
    if error == nil {
    if objects.count > 0 {
    let message = objects[0].objectForKey("message") as! NSString
    print("[FIND] \(message)")
    } else {
    var saveError: NSError?
    let obj = NCMBObject(className: "TestClass")
    obj.setObject("Hello, NCMB!", forKey: "message")
    obj.save(&saveError)
    if saveError == nil {
    print("[SAVE] Done.")
    } else {
    print("[SAVE ERROR] \(saveError)")
    }
    }
    } else {
    print(error.localizedDescription)
    }
        //▲▲▲起動時に処理される▲▲▲
        return true
    }
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

