//
//  HumanoidIntelligenceEntity.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidIntelligence Module Entity
enum IntelligenceEntity {
    
    struct IntelligenceView {
        var technological: String
        var health: String
        var language: String
        var icon: UIImage
    }
    
    
    struct IntelligenceData {
        var technological: Int
        var health: Int
        var language: Int
        var icon: Data
    }
}
