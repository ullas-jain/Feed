//
//  AppDelegate.swift
//  EssentialApp
//
//  Created by ULLAS JAIN on 25/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)

        #if DEBUG
            configuration.delegateClass = DebuggingSceneDelegate.self
        #endif

        return configuration
    }
}
