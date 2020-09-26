//
//  ListRepositorieCoordinator.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation
import UIKit

class ListRepositorieCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.isTranslucent = false
        navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let listRepositorieViewController = ListRepositorieViewController()
        listRepositorieViewController.coordinator = self
        navigationController.pushViewController(listRepositorieViewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("ListRepositorieCoordinator deinit")
    }
    
}
