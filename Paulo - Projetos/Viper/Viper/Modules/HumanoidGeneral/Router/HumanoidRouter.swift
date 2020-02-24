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
        
        // Transferencia de dados
        let strength = StrengthEntity.StrengthView(staticStr: viewController.staticStrLabel.text!, eccentricStr: viewController.eccentricStrLabel.text!, concentricStr: viewController.concentricStrLabel.text!, icon: viewController.iconStr.image!)
        self.viewController.show(view, sender: nil)
        view.set(object: strength)
    }
    
    
    func showIntelligenceModule() {
        
        // Aqui poderíamos passa informações de o Module
        // atual para o que estamos inicializando
        let view = viewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerName.intelligence) as! HumanoidIntelligenceView
        
        
//        let intelligence = IntelligenceEntity.IntelligenceView(technological: viewController.technologicalIntLabel.text!, health: viewController.healthIntLabel.text!, language: viewController.languageIntLabel.text!, icon: viewController.iconInt.image!)
        self.viewController.show(view, sender: nil)
//        view.set(object: intelligence)
    }
}
