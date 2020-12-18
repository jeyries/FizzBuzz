//
//  AppCoordinator.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit

// Coordinator between the various view controllers of the app

final class AppCoordinator {
    
    let statisticsService = StatisticsService()
    
    var rootViewControler: UIViewController {
        return tabBarController
    }
    
    private lazy var tabBarController: UITabBarController = {
        let tab = UITabBarController()
        tab.viewControllers = [fizzBuzzNavController, statisticsNavController]
        return tab
    }()
    
    private lazy var fizzBuzzNavController: UINavigationController = {
        let nav = UINavigationController()
        nav.viewControllers = [formViewController]
        nav.tabBarItem = .init(tabBarSystemItem: .search, tag: 1)
        return nav
    }()
    
    private lazy var statisticsNavController: UINavigationController = {
        let nav = UINavigationController()
        nav.viewControllers = [statisticsViewController]
        nav.tabBarItem = .init(tabBarSystemItem: .history, tag: 2)
        return nav
    }()
    
    private lazy var formViewController: UIViewController = {
        let controller = FormViewController()
        controller.callback = { [weak self] action in
            switch action {
            case .compute(let fizzBuzz):
                self?.showResults(fizzBuzz: fizzBuzz)
                
            }
        }
        return controller
    }()
    
    private lazy var statisticsViewController: UIViewController = {
        let controller = StatisticsViewController(statisticsService: statisticsService)
        return controller
    }()
    
}

extension AppCoordinator {
    
    func start() {
        // nothing here
    }
    
    func showResults(fizzBuzz: FizzBuzz) {
        statisticsService.addRequest(fizzBuzz: fizzBuzz)
        
        let controller = ResultsViewController(fizzBuzz: fizzBuzz)
        fizzBuzzNavController.pushViewController(controller, animated: true)
    }
    
    
}
