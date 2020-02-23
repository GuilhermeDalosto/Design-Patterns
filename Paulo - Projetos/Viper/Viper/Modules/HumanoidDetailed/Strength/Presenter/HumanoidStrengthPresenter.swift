//
//  HumanoidStrengthPresenter.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidStrength Module Presenter
class HumanoidStrengthPresenter {
    
    weak private var _view: HumanoidStrengthViewProtocol?
    private var interactor: HumanoidStrengthInteractorProtocol
    private var wireframe: HumanoidStrengthRouterProtocol
    
    init(view: HumanoidStrengthViewProtocol) {
        self._view = view
        self.interactor = HumanoidStrengthInteractor()
        self.wireframe = HumanoidStrengthRouter()
    }
}

// MARK: - extending HumanoidStrengthPresenter to implement it's protocol
extension HumanoidStrengthPresenter: HumanoidStrengthPresenterProtocol {
    
    // Chamado pela View
    func fetch(objectFor view: HumanoidStrengthViewProtocol) {
        interactor.fetch(objectFor: self)
    }
    
    // Chamado pelo interactor
    func interactor(_ interactor: HumanoidStrengthInteractorProtocol, didFetch object: StrengthEntity.StrengthData) {
        
        let strengthView = StrengthEntity.StrengthView(staticStr: String(object.staticStr), eccentricStr: String(object.eccentricStr), concentricStr: String(object.concentricStr), icon: UIImage(data: object.icon)!)
        
        _view?.set(object: strengthView)
    }
}
