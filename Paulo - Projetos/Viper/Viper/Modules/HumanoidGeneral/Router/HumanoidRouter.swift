//
//  HumanoidRouter.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module Router (aka: Wireframe)
class HumanoidRouter: HumanoidRouterProtocol {
    
    weak var viewController: HumanoidView!
    
    func showStrengthModule() {
        
        // Aqui poderíamos passa informações de o Module
        // atual para o que estamos inicializando
        let view = viewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerName.strength) as! HumanoidStrengthView
        self.viewController.show(view, sender: nil)
    }
    
    
    func showIntelligenceModule() {
        
        // Aqui poderíamos passa informações de o Module
        // atual para o que estamos inicializando
        let view = viewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerName.intelligence) as! HumanoidIntelligenceView
        self.viewController.show(view, sender: nil)
    }
}
