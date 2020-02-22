//
//  CharacterCreatorRouter.swift
//  VIPER
//
//  Created by Guilherme Martins Dalosto de Oliveira on 19/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class CharacterCreatorRouter : CCRouterLogic{
    
    weak var viewController : CharacterCreatorController!
    
    func changeView(identifier segue: String) {
        viewController.performSegue(withIdentifier: segue, sender: nil)        
    }
    
    
    
}
