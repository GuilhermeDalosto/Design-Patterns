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
    
    var viewController: HumanoidView!
    
    var navigationController: UINavigationController!
    
    //    weak var viewController: HumanoidView!
    
    
    init(navigationController: UINavigationController, vc: HumanoidView) {
        self.navigationController = navigationController
        self.viewController = vc
    }
    
    
    func presentStrengthModule(fromViewController: HumanoidView, toViewController: HumanoidStrengthView, animated: Bool) {
        
        // Transferencia de dados de um Module para outro
        let strength = StrengthEntity.StrengthView(staticStr: fromViewController.staticStrLabel.text!, eccentricStr: fromViewController.eccentricStrLabel.text!, concentricStr: fromViewController.concentricStrLabel.text!, icon: fromViewController.iconStr.image!)
        
        toViewController.sendData(object: strength)
        navigationController.pushViewController(toViewController, animated: animated)
    }
    
    
    func presentIntelligenceModule(fromViewController: HumanoidView, toViewController: HumanoidIntelligenceView, animated: Bool) {
        
        // Aqui poderíamos passar informações do Module
        // atual para o que estamos inicializando
        //        let intelligence = IntelligenceEntity.IntelligenceView(technological: viewController.technologicalIntLabel.text!, health: viewController.healthIntLabel.text!, language: viewController.languageIntLabel.text!, icon: viewController.iconInt.image!)
        navigationController.pushViewController(toViewController, animated: animated)
        //        view.set(object: intelligence)
    }
    
    
    func presentHumanModule(_ viewController: HumanoidView, animated: Bool) {
        
        navigationController.pushViewController(viewController, animated: animated)
    }
}
