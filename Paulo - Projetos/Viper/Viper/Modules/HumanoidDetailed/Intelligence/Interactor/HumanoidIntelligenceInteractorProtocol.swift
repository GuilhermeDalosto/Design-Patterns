//
//  HumanoidIntelligenceInteractorProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

//MARK: Interactor -
/// HumanoidIntelligence Module Interactor Protocol
protocol HumanoidIntelligenceInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: HumanoidIntelligencePresenterProtocol)
}
