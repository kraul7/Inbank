//
//  AppLoader.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

struct AppLoader {
    private let window: UIWindow
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactory

    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactory = ModuleFactoryImpl()) {
        self.window = window
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }

    func build() {
        let viewController = UIViewController()
        setRootViewController(viewController)
    }

    private func setRootViewController(_ viewController: UIViewController?) {
        window.rootViewController = navigationController

        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: true)
        }

        window.makeKeyAndVisible()
    }
}
