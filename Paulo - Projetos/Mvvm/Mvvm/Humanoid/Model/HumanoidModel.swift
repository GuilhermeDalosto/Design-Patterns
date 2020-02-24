//
//  HumanoidModel.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit

/// Como é guardado em uma dependência, banco, json, etc.
enum HumanoidModel {
    
    struct HumanoidData {
        var id: Int
        var strength: StrengthModel.StrengthData
        var intelligence: IntelligenceModel.IntelligenceData
        
        init(id: Int, strength: StrengthModel.StrengthData, intelligence: IntelligenceModel.IntelligenceData) {
            self.id = id
            self.strength = strength
            self.intelligence = intelligence
        }
        
        
        init(view: HumanoidView) {
            self.id = Int(view.id)!
            self.strength = StrengthModel.StrengthData(view: view.strength)
            self.intelligence = IntelligenceModel.IntelligenceData(view: view.intelligence)
        }
    }
    
    
    struct HumanoidView {
        var id: String
        var strength: StrengthModel.StrengthView
        var intelligence: IntelligenceModel.IntelligenceView
        
        init(id: String, strength: StrengthModel.StrengthView, intelligence: IntelligenceModel.IntelligenceView) {
            self.id = id
            self.strength = strength
            self.intelligence = intelligence
        }
        
        
        init(view: HumanoidData) {
            self.id = String(view.id)
            self.strength = StrengthModel.StrengthView(view: view.strength)
            self.intelligence = IntelligenceModel.IntelligenceView(view: view.intelligence)
        }
    }
}
