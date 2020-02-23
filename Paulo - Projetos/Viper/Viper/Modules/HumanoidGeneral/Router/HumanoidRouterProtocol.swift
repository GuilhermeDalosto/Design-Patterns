//
//  HumanoidRouterProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

//MARK: Router (aka: Wireframe) -
/// Humanoid Module Router Protocol
protocol HumanoidRouterProtocol {
    var viewController: HumanoidView! { get set }
    // Show Details of Entity Object coming from ParentView Controller.
//     func showDetailsFor(object: HumanoidEntity, parentViewController viewController: UIViewController)
    
    func showStrengthModule()
    
    func showIntelligenceModule()
}
