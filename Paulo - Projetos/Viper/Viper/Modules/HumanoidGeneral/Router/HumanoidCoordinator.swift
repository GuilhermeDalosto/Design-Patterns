//
//  Coordinator.swift
//  Viper
//
//  Created by Paulo Ricardo on 2/25/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


class HumanoidCoordinator {
    
    let router: HumanoidRouter!
    
//    private lazy var linearViewControllers = [HumanoidStrengthView.instantiate(), HumanoidStrengthView.instantiate()]
    
    private lazy var namedViewControllers = [
        Constants.ModuleNames.intelligence : HumanoidIntelligenceView.instantiate(),
        Constants.ModuleNames.strength : HumanoidStrengthView.instantiate(),
        Constants.ModuleNames.humanoid : HumanoidView.instantiate()]
    
    /// View principal
    private lazy var humanoidView = HumanoidView.instantiate()
    
    init(router: HumanoidRouter) {
        self.router = router
    }
}


extension HumanoidCoordinator: CoordinatorNominalDelegate {
    
    func present(_ constantModuleName: String) {
        switch constantModuleName {
        case Constants.ModuleNames.strength:
            router.presentStrengthModule(fromViewController: router.viewController, toViewController: namedViewControllers[Constants.ModuleNames.strength] as! HumanoidStrengthView, animated: true)
        case Constants.ModuleNames.intelligence:
            router.presentIntelligenceModule(fromViewController: router.viewController, toViewController: namedViewControllers[Constants.ModuleNames.intelligence] as! HumanoidIntelligenceView, animated: true)
        default:
            router.presentHumanModule(humanoidView, animated: true)
        }
    }
    
    
    /// Usamos quando estamos em modo linear do Coordinator
//    private func linearViewController(after controller: UIViewController) -> UIViewController? {
//        guard let index = linearViewControllers.firstIndex(where: { $0 === controller }), index < linearViewControllers.count - 1 else { return nil }
//        return linearViewControllers[index + 1]
//    }
}
