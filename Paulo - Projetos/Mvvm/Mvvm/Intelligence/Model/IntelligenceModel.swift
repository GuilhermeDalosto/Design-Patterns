//
//  IntelligenceModel.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


enum IntelligenceModel {
    
    struct IntelligenceView {
        var technological: String
        var health: String
        var language: String
        var icon: UIImage
        
        init(technological: String, health: String, language: String, icon: UIImage) {
            self.technological = technological
            self.health = health
            self.language = language
            self.icon = icon
        }
        
        
        init(view: IntelligenceData) {
            self.technological = String(view.technological)
            self.health = String(view.health)
            self.language = String(view.language)
            self.icon = UIImage(data: view.icon)!
        }
    }
    
    
    struct IntelligenceData {
        var technological: Int
        var health: Int
        var language: Int
        var icon: Data
        
        init(technological: Int, health: Int, language: Int, icon: Data) {
            self.technological = technological
            self.health = health
            self.language = language
            self.icon = icon
        }
        
        
        init(view: IntelligenceView) {
            self.technological = Int(view.technological)!
            self.health = Int(view.health)!
            self.language = Int(view.language)!
            self.icon = view.icon.pngData()!
        }
    }
}
