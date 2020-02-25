//
//  HumanoidPresenterProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

//MARK: Presenter -
/// Humanoid Module Presenter Protocol
protocol HumanoidPresenterProtocol {
    
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: HumanoidViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
//    func interactor(_ interactor: HumanoidInteractorProtocol, didFetch object: HumanoidEntity)
//    /// The Interactor will inform the Presenter a failed fetch.
//    func interactor(_ interactor: HumanoidInteractorProtocol, didFailWith error: Error)
    func store(humanoid object: HumanoidEntity.HumanoidView)
    
    // O interactor vai fornecer ao Presenter os dados que ele obteu.
    func present(object: HumanoidEntity.HumanoidData)
    
    
    // Função chamado pela View quando for mudar de Module
    func showModule(_ constantModuleName: String)
}
