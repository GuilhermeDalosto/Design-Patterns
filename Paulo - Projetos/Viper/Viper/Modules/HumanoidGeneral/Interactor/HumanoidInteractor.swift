//
//  HumanoidInteractor.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module Interactor
class HumanoidInteractor: HumanoidInteractorProtocol {
    
    // Conexão com a presenter
    var presenter: HumanoidPresenterProtocol!
    
    func fetch(objectFor presenter: HumanoidPresenterProtocol) {
        // É aqui que damos fetch em um banco ou framework para pegar os
        // dados, também é possível que seja feita alguma transformação
        // dos dadosresgatados, como filtrá-los.
        let data = UIImage(named: "str")!.pngData()
        let data2 = UIImage(named: "int")!.pngData()
        let basicHumanoid = HumanoidEntity.HumanoidData(id: 1, strength: StrengthEntity.StrengthData(staticStr: 2, eccentricStr: 3, concentricStr: 5, icon: data!), intelligence: IntelligenceEntity.IntelligenceData(technological: 4, health: 7, language: 1, icon: data2!))
        
        presenter.present(object: basicHumanoid)
    }
    
    
    func store(objectToStore object: HumanoidEntity.HumanoidData) {
        // Suppose we have a data store to store the incoming object from presenter
        var database: [HumanoidEntity.HumanoidData] = []
        database.append(object)
    }
}
