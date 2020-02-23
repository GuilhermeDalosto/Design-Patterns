//
//  HumanoidIntelligencePresenter.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidIntelligence Module Presenter
class HumanoidIntelligencePresenter {
    
    weak private var _view: HumanoidIntelligenceViewProtocol?
    private var interactor: HumanoidIntelligenceInteractorProtocol
    private var wireframe: HumanoidIntelligenceRouterProtocol
    
    init(view: HumanoidIntelligenceViewProtocol) {
        self._view = view
        self.interactor = HumanoidIntelligenceInteractor()
        self.wireframe = HumanoidIntelligenceRouter()
    }
}

// MARK: - extending HumanoidIntelligencePresenter to implement it's protocol
extension HumanoidIntelligencePresenter: HumanoidIntelligencePresenterProtocol {
    
    // chamado pela View
    func fetch(objectFor view: HumanoidIntelligenceViewProtocol) {
        interactor.fetch(objectFor: self)
    }
    
    // Chamado pelo Interactor
    func interactor(_ interactor: HumanoidIntelligenceInteractorProtocol, didFetch object: IntelligenceEntity.IntelligenceData) {
        
        // Transformamos o objeto resgatado do banco para um que a view possa mostrar
        let intelligenceView = IntelligenceEntity.IntelligenceView(technological: String(object.technological), health: String(object.health), language: String(object.language), icon: UIImage(data: object.icon)!)
        
        _view?.set(object: intelligenceView)
    }
}
