//
//  SceneDelegate.swift
//  Strategy
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let nc = UINavigationController()
        let vc = LaunchView()
        nc.pushViewController(vc, animated: false)
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}

