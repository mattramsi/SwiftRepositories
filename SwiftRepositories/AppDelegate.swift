//
//  AppDelegate.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 25/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var listRepositorieCoordinator: ListRepositorieCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        listRepositorieCoordinator = ListRepositorieCoordinator()
        window?.rootViewController = listRepositorieCoordinator?.navigationController
        window?.makeKeyAndVisible()
        listRepositorieCoordinator?.start()
        
        
        return true
    }

}

