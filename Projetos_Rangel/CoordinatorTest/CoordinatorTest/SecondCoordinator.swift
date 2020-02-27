//
//  SecondCoordinator.swift
//  CoordinatorTest
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation
import UIKit
protocol BackToFirstViewController:class{
    func dismissToFirstViewController() -> Void
}
class SecondCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    
    weak var delegate: BackToFirstViewController?
    
    required init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        navigationController.pushViewController(secondVC, animated: true)
    }
    
    
}


extension SecondCoordinator: SecondViewControllerDelegate{
    func navigateToFirstViewController() {
        self.delegate?.dismissToFirstViewController()
    }
    
    func navigateToThirdViewController() {
        let thirdViewController : ThirdViewController = ThirdViewController()
        thirdViewController.delegate = self.delegate
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    
}


