//
//  AppCoordinator.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private let container: DIContainer
    
    private let navigationController = UINavigationController()
    
    init(window: UIWindow, container: DIContainer) {
        self.window = window
        self.container = container
    }
    
    func start(){
        let todoListVC = container.makeTodosListModule(navigationController: navigationController)
        
        navigationController.viewControllers = [todoListVC]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
