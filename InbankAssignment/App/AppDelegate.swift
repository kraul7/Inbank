//
//  AppDelegate.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private lazy var loader = AppLoader()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loader.build()
        return true
    }
}

