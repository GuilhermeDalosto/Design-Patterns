//
//  HumanoidRouterProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module Router Protocol
protocol HumanoidRouterProtocol {
    
    var viewController: HumanoidView! { get set }
    var navigationController: UINavigationController! { get set }
    
    func presentHumanModule(_ viewController: HumanoidView, animated: Bool)
    
    func presentIntelligenceModule(fromViewController: HumanoidView, toViewController: HumanoidIntelligenceView, animated: Bool)
    
    func presentStrengthModule(fromViewController: HumanoidView, toViewController: HumanoidStrengthView, animated: Bool)
}
