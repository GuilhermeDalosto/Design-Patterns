//
//  CharacterCreatorModel.swift
//  VIPER
//
//  Created by Guilherme Martins Dalosto de Oliveira on 19/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

struct Character{
    var name: String
    var level: Int
    var isFavorite: Bool
}

extension Character: CustomStringConvertible{
    var description: String {
        return "\(name) - \(level)"
    }
    
    
}
