//
//  StrengthModel.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation


import UIKit

/// HumanoidStrength Module Entity
enum StrengthModel {
    struct StrengthData {
        var staticStr: Int
        var eccentricStr: Int
        var concentricStr: Int
        var icon: Data
        
        init(staticStr: Int, eccentricStr: Int, concentricStr: Int, icon: Data) {
            self.staticStr = staticStr
            self.eccentricStr = eccentricStr
            self.concentricStr = concentricStr
            self.icon = icon
        }
        
        init(view: StrengthView) {
            self.staticStr = Int(view.staticStr)!
            self.eccentricStr = Int(view.eccentricStr)!
            self.concentricStr = Int(view.concentricStr)!
            self.icon = view.icon.pngData()!
        }
    }
    
    struct StrengthView {
        var staticStr: String
        var eccentricStr: String
        var concentricStr: String
        var icon: UIImage
        
        init(staticStr: String, eccentricStr: String, concentricStr: String, icon: UIImage) {
            self.staticStr = staticStr
            self.eccentricStr = eccentricStr
            self.concentricStr = concentricStr
            self.icon = icon
        }
        
        init(view: StrengthData) {
            self.staticStr = String(view.staticStr)
            self.eccentricStr = String(view.eccentricStr)
            self.concentricStr = String(view.concentricStr)
            self.icon = UIImage(data: view.icon)!
        }
    }
}
