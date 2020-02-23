//
//  HumanoidStrengthEntity.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidStrength Module Entity
enum StrengthEntity {
    struct StrengthData {
        var staticStr: Int
        var eccentricStr: Int
        var concentricStr: Int
        var icon: Data
    }
    
    struct StrengthView {
        var staticStr: String
        var eccentricStr: String
        var concentricStr: String
        var icon: UIImage
    }
}
