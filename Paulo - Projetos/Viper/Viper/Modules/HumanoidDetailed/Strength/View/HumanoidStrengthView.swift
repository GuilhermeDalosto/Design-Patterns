//
//  HumanoidStrengthView.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidStrength Module View
class HumanoidStrengthView: UIViewController {
    
    private var presenter: HumanoidStrengthPresenterProtocol!
    
    private var object: StrengthEntity.StrengthView?
    
    //MARK: - Outlets
    @IBOutlet var icon: UIImageView!
    @IBOutlet var staticStrLabel: UILabel!
    @IBOutlet var eccentricStrLabel: UILabel!
    @IBOutlet var concentricStrLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - extending HumanoidStrengthView to implement it's protocol
extension HumanoidStrengthView: HumanoidStrengthViewProtocol {
    func set(object: StrengthEntity.StrengthView) {
        icon.image = object.icon
        staticStrLabel.text = object.staticStr
        eccentricStrLabel.text = object.eccentricStr
        concentricStrLabel.text = object.concentricStr
    }
}
