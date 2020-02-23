//
//  HumanoidEntity.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module Entity
// Como é guardado em uma dependência, banco, json, etc.
enum HumanoidEntity {
    
    struct HumanoidData {
        var id: Int
        var strength: StrengthEntity.StrengthData
        var intelligence: IntelligenceEntity.IntelligenceData
    }
    
    
    struct HumanoidView {
        var id: String
        var strength: StrengthEntity.StrengthView
        var intelligence: IntelligenceEntity.IntelligenceView
    }
}
