//
//  HumanoidInteractorProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

//MARK: Interactor -
/// Humanoid Module Interactor Protocol
protocol HumanoidInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: HumanoidPresenterProtocol)
    
    // Store Object into Data Layer
    func store(objectToStore object: HumanoidEntity.HumanoidData)
}
