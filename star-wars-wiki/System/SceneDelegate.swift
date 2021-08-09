//
//  SceneDelegate.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 7/31/21.
//

import UIKit

@available(iOS 13, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate, WindowManaging {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: scene)
        setRoot(viewController: HomeVC(
                    logger: DependencyContainer.shared.logger,
                    swapiInteractor: DependencyContainer.shared.swapiInteractor))
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

