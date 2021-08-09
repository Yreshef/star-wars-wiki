//
//  AppDelegate.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 7/31/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, WindowManaging {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {
            // Any initialization before SceneDelegate
            // From here on out, Scene Delegate will take control
        } else {
            //If less than iOS 13, AppDelegate still manages scenes.
            self.window = UIWindow()
            setRoot(viewController: HomeVC(
                        logger: DependencyContainer.shared.logger,
                        swapiInteractor: DependencyContainer.shared.swapiInteractor))
        }
        DependencyContainer.shared.initializeServices()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

