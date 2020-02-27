//
//  FirstCoordinator.swift
//  CoordinatorTest
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators:[Coordinator] {get set}
    
    init(navigation: UINavigationController)
    
    func start() -> Void
}

class FirstCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let viewController = ViewController(nibName: "FirstViewController", bundle: Bundle.main)
        viewController.delegate = self
//        self.navigationController.viewControllers = [viewController]
        self.navigationController.show(viewController, sender: nil)
    }
    
    
}



extension FirstCoordinator: FirstViewControllDelegate{
    func navigateToNextPage() {
        let secondCoordinator = SecondCoordinator(navigation: navigationController)
        secondCoordinator.delegate = self
        childCoordinators.append(secondCoordinator)
        secondCoordinator.start()
    
    
    }
  
}

extension FirstCoordinator: BackToFirstViewController{
    func dismissToFirstViewController() {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
    
    
}
