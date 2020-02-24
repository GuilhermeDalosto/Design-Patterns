//
//  IntelligenceViewModel.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


class IntelligenceViewModel {
    
    weak var viewController: IntelligenceViewController!
    /// Usamos para passar para a View.
    private var intelligenceView: IntelligenceModel.IntelligenceView!
    /// Usaremos quando formos salvar algum dado no banco.
    private var intelligenceData: IntelligenceModel.IntelligenceData!
    
    
    func didLoad(view: IntelligenceViewController) {
        self.viewController = view
        fetch()
    }
    
    
    func getIntView() -> IntelligenceModel.IntelligenceView {
        // Aqui introduziriamos o caso de quando a View pedir os dados sem que a requisição do fetch() tenha terminado.
        /*
         guard let _ = self.intelligenceView else {
             return fetch()
         }
         se já possui retornamos o dado que já foi resgatado do banco
         */
        
        return intelligenceView
    }
    
    
    func fetch() {
        
        // Supomos que estamos pegando esse dado
        // de algum serviço (database/repository)
        let icon = UIImage(named: "str")
        let data = icon!.pngData()
        
        // É aqui que fazemos a requisição no banco.
        intelligenceData = IntelligenceModel.IntelligenceData(technological: 2, health: 4, language: 6, icon: data!)
        
        intelligenceView = IntelligenceModel.IntelligenceView(view: intelligenceData)
    }
}
