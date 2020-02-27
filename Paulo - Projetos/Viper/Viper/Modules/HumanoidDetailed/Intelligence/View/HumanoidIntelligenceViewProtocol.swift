//
//  HumanoidIntelligenceViewProtocol.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// HumanoidIntelligence Module View Protocol
protocol HumanoidIntelligenceViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type HumanoidIntelligenceEntity
    func set(object: IntelligenceEntity.IntelligenceView)
}
