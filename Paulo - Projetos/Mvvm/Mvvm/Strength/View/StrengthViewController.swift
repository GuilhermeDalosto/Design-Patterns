//
//  StrengthView.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


class StrengthViewController: UIViewController {
    
    private var strengthViewModel: StrengthViewModel!
    //MARK: - Outlets
    @IBOutlet var icon: UIImageView!
    @IBOutlet var staticStrLabel: UILabel!
    @IBOutlet var eccentricStrLabel: UILabel!
    @IBOutlet var concentricStrLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strengthViewModel = StrengthViewModel()
        
        // Informs the ViewModel that the View is ready to receive data.
        strengthViewModel.didLoad(view: self)
        
        // É a View quem determina quando vai precisar usar os dados requisitados.
        self.set()
    }
    
    
    func set() {
        // Aqui a View nem precisa saber qual o tipo da intelligenceModel
        let strengthModel = strengthViewModel.getStrView()
        
        icon.image = strengthModel.icon
        staticStrLabel.text = strengthModel.staticStr
        eccentricStrLabel.text = strengthModel.eccentricStr
        concentricStrLabel.text = strengthModel.concentricStr
    }
}
