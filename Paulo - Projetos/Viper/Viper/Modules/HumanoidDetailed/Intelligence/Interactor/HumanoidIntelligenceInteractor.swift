//
//  HumanoidIntelligenceInteractor.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidIntelligence Module Interactor
class HumanoidIntelligenceInteractor: HumanoidIntelligenceInteractorProtocol {
    func fetch(objectFor presenter: HumanoidIntelligencePresenterProtocol) {
        // Supomos que estamos pegando esse dado
        // de algum serviço (database/repository)
        let icon = UIImage(named: "int")
        let data = icon!.pngData()
        
        let intelligenceData = IntelligenceEntity.IntelligenceData(technological: 2, health: 4, language: 8, icon: data!)
        
        presenter.interactor(self, didFetch: intelligenceData)
    }

}
