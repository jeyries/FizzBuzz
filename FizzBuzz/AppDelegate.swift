//
//  AppDelegate.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appCoordinator = AppCoordinator()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
        appCoordinator.start()

        window = UIWindow()
        window!.rootViewController = appCoordinator.rootViewControler
        window!.makeKeyAndVisible()
        return true
    }


}

