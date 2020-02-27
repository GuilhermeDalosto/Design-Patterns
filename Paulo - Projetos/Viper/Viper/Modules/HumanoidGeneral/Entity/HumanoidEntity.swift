//
//  HumanoidEntity.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module Entity
/// Como é guardado em uma dependência, banco, json, etc.
enum HumanoidEntity {
    
    struct HumanoidData {
        var id: Int
        var strength: StrengthEntity.StrengthData
        var intelligence: IntelligenceEntity.IntelligenceData
        
        init(id: Int, strength: StrengthEntity.StrengthData, intelligence: IntelligenceEntity.IntelligenceData) {
            self.id = id
            self.strength = strength
            self.intelligence = intelligence
        }
        
        
        init(view: HumanoidView) {
            self.id = Int(view.id)!
            self.strength = StrengthEntity.StrengthData(view: view.strength)
            self.intelligence = IntelligenceEntity.IntelligenceData(view: view.intelligence)
        }
    }
    
    
    struct HumanoidView {
        var id: String
        var strength: StrengthEntity.StrengthView
        var intelligence: IntelligenceEntity.IntelligenceView
        
        init(id: String, strength: StrengthEntity.StrengthView, intelligence: IntelligenceEntity.IntelligenceView) {
            self.id = id
            self.strength = strength
            self.intelligence = intelligence
        }
        
        
        init(view: HumanoidData) {
            self.id = String(view.id)
            self.strength = StrengthEntity.StrengthView(view: view.strength)
            self.intelligence = IntelligenceEntity.IntelligenceView(view: view.intelligence)
        }
    }
}
