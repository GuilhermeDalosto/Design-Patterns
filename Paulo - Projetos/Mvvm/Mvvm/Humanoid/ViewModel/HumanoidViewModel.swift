//
//  HumanoidViewModel.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


class HumanoidViewModel {
    
    var viewController: HumanoidViewController!
    var humanoidData: HumanoidModel.HumanoidData!
    var humanoidView: HumanoidModel.HumanoidView!
    
    
    func didLoad(view: HumanoidViewController) {
        self.viewController = view
        self.fetch()
    }
    
    func fetch() {
        // É aqui que damos fetch em um banco ou framework para pegar os
        // dados, também é possível que seja feita alguma transformação
        // dos dadosresgatados, como filtrá-los.
        let data = UIImage(named: "str")!.pngData()
        let data2 = UIImage(named: "int")!.pngData()
        let strengthData = StrengthModel.StrengthData(staticStr: 2, eccentricStr: 3, concentricStr: 5, icon: data!)
        let intelligenceData = IntelligenceModel.IntelligenceData(technological: 4, health: 7, language: 1, icon: data2!)
        
        humanoidData = HumanoidModel.HumanoidData(id: 1, strength: strengthData, intelligence: intelligenceData)
        
        humanoidView = HumanoidModel.HumanoidView(view: humanoidData)
    }
    
    
    func getStrength() -> StrengthModel.StrengthView {
        
        return humanoidView.strength
    }
    
    
    func getIntelligence() -> IntelligenceModel.IntelligenceView {
        
        return humanoidView.intelligence
    }
    
    
    func getHumanoid() -> HumanoidModel.HumanoidView {
        
        return humanoidView
    }
    
    
    func storeHumanoid() {
        
        // Suppose we have a data store to store the incoming object from presenter
        var database: [HumanoidModel.HumanoidData] = []
        database.append(humanoidData)
    }
    
    
    func showModule(_ constantModuleName: String, parentView: HumanoidViewController) {
        // Aqui podemos ter alguma lógica para qual Module ir
        if constantModuleName == Constants.ModuleNames.intelligence {
            showIntelligenceModule()
        } else {
            showStrengthModule()
        }
    }
    
    
    func showStrengthModule() {
        
        // Aqui poderíamos passa informações de o Module
        // atual para o que estamos inicializando
        let view = self.viewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerName.strength) as! StrengthViewController
        self.viewController.show(view, sender: nil)
    }
    
    
    func showIntelligenceModule() {
        
        // Aqui poderíamos passa informações de o Module
        // atual para o que estamos inicializando
        let view = self.viewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerName.intelligence) as! IntelligenceViewController
        self.viewController.show(view, sender: nil)
    }
}
