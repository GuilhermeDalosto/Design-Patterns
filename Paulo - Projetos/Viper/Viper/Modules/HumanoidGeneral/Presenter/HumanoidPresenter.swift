//
//  HumanoidPresenter.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module Presenter
class HumanoidPresenter {
    
    weak private var _view: HumanoidViewProtocol?
    private var interactor: HumanoidInteractorProtocol
//    private var wireframe: HumanoidRouterProtocol
    var nominalCoordinatorDelegate: CoordinatorNominalDelegate?
    
    init(view: HumanoidViewProtocol, navController: UINavigationController) {
        self._view = view
        self.interactor = HumanoidInteractor()
        let router = HumanoidRouter(navigationController: navController, vc: _view as! HumanoidView)
        // Quando usamos coordinators, podemos decidir qual coordinator usar
        self.nominalCoordinatorDelegate = HumanoidCoordinator(router: router)
    }
}

// MARK: - extending HumanoidPresenter to implement it's protocol
extension HumanoidPresenter: HumanoidPresenterProtocol {
    
    func present(object: HumanoidEntity.HumanoidData) {
        
        // Aqui assinalamos os dados obtidos anteriormente e
        // adaptamos para enviá-los para o Presenter
        var icon = UIImage(data: object.strength.icon)
        let humanoidStrength = StrengthEntity.StrengthView(staticStr: String(object.strength.staticStr), eccentricStr: String(object.strength.eccentricStr), concentricStr: String(object.strength.concentricStr), icon: icon!)
        
        icon = UIImage(data: object.intelligence.icon)
        let humanoidIntelligence = IntelligenceEntity.IntelligenceView(technological: String(object.intelligence.technological), health: String(object.intelligence.health), language: String(object.intelligence.language), icon: icon!)
        
        let humanoidGeneral = HumanoidEntity.HumanoidView(id: "Id: \(object.id)", strength: humanoidStrength, intelligence: humanoidIntelligence)
        
        _view?.set(setStrength: humanoidStrength)
        _view?.set(setIntelligence: humanoidIntelligence)
        _view?.set(setHum: humanoidGeneral)
    }
    
    
    func fetch(objectFor view: HumanoidViewProtocol) {
        interactor.fetch(objectFor: self)
    }
    
    
    func store(humanoid object: HumanoidEntity.HumanoidView) {
        
        
        let humanoidData = HumanoidEntity.HumanoidData(id: Int(object.id)!, strength: StrengthEntity.StrengthData(staticStr: Int(object.strength.staticStr)!, eccentricStr: Int(object.strength.eccentricStr)!, concentricStr: Int(object.strength.concentricStr)!, icon: object.strength.icon.pngData()!), intelligence: IntelligenceEntity.IntelligenceData(technological: Int(object.intelligence.technological)!, health: Int(object.intelligence.health)!, language: Int(object.intelligence.language)!, icon: object.intelligence.icon.pngData()!))
        
        interactor.store(objectToStore: humanoidData)
    }
    
    
    func showModule(_ constantModuleName: String) {
        // Aqui podemos ter alguma lógica para qual Module ir
        // Quando usamos coordinators, podemos decidir qual coordinator usar
        nominalCoordinatorDelegate?.present(constantModuleName)
        
//        wireframe.viewController = parentView
//        if constantModuleName == Constants.ModuleNames.intelligence {
//            wireframe.showIntelligenceModule()
//        } else {
//            wireframe.showStrengthModule()
//        }
    }
}
