//
//  HumanoidViewProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// Humanoid Module View Protocol
protocol HumanoidViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type HumanoidEntity
//    func set(setHuman object: HumanoidEntity)
    
    /// Set the view Object of Type HumanoidDetail.HumanoidIntelligence
    func set(setIntelligence object: IntelligenceEntity.IntelligenceView)
    
    /// Set the view Object of Type HumanoidDetail.HumanoidStrength
    func set(setStrength object: StrengthEntity.StrengthView)
    
    /// Set the view Object of Type HumanoidDetail.HumanoidStrength
    func set(setHum object: HumanoidEntity.HumanoidView)
}
