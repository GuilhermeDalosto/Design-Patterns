//
//  StrengthViewModel.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit

class StrengthViewModel {
    
    weak var view: StrengthViewController!
    
    /// Usamos para passar para a View.
    private var strengthView: StrengthModel.StrengthView!
    /// Usaremos quando formos salvar algum dado no banco.
    private var strengthData: StrengthModel.StrengthData!
    
    
    func didLoad(view: StrengthViewController) {
        self.view = view
        fetch()
    }
    
    
    func fetch() {
        
        // Supomos que estamos pegando esse dado
        // de algum serviço (database/repository)
        let icon = UIImage(named: "str")
        let data = icon!.pngData()
        
        // É aqui que fazemos a requisição no banco.
        strengthData = StrengthModel.StrengthData(staticStr: 2, eccentricStr: 4, concentricStr: 6, icon: data!)
        
        strengthView = StrengthModel.StrengthView(view: strengthData)
    }
    
    
    func getStrView() -> StrengthModel.StrengthView {
        // Aqui introduziriamos o caso de quando a View pedir os dados sem que a requisição do fetch() tenha terminado.
        /*
         guard let _ = self.intelligenceView else {
             return fetch()
         }
         se já possui retornamos o dado que já foi resgatado do banco
         */
        
        return strengthView
    }
}
