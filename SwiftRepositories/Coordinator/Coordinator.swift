//
//  Coordinator.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
    func childDidFinish(_ child: Coordinator?)
    
}

extension Coordinator {
    
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{$0 !== coordinator}
    }
    
    func childDidFinish(_ child: Coordinator?) {
        guard let child = child else {return}
        remove(childCoordinator: child)
    }
    
}

