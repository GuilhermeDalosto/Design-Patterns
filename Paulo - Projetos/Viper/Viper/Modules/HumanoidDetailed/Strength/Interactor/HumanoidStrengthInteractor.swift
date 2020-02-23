//
//  HumanoidStrengthInteractor.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidStrength Module Interactor
class HumanoidStrengthInteractor: HumanoidStrengthInteractorProtocol {
    
    // Chamado pelo Presenter
    func fetch(objectFor presenter: HumanoidStrengthPresenterProtocol) {
        // Supomos que estamos pegando esse dado
        // de algum serviço (database/repository)
        let icon = UIImage(named: "str")
        let data = icon!.pngData()
        
        let strengthData = StrengthEntity.StrengthData(staticStr: 2, eccentricStr: 4, concentricStr: 8, icon: data!)
        
        presenter.interactor(self, didFetch: strengthData)
    }
}
