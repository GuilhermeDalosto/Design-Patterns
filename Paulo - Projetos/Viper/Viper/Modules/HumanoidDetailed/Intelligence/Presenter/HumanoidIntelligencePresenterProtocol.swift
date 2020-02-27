//
//  HumanoidIntelligencePresenterProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

//MARK: Presenter -
/// HumanoidIntelligence Module Presenter Protocol
protocol HumanoidIntelligencePresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: HumanoidIntelligenceViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: HumanoidIntelligenceInteractorProtocol, didFetch object: IntelligenceEntity.IntelligenceData)
    /// The Interactor will inform the Presenter a failed fetch.
//    func interactor(_ interactor: HumanoidIntelligenceInteractorProtocol, didFailWith error: Error)
}
