//
//  SellViewController.swift
//  Coordinator
//
//  Created by Guilherme Martins Dalosto de Oliveira on 17/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class SellViewController : UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    
    
    @IBAction func change(_ sender: UIButton) {
        coordinator?.change2()
    }
    
    
}
