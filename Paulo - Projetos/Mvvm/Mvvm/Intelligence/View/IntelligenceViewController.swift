//
//  IntelligenceViewController.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


class IntelligenceViewController: UIViewController {
    
    private var intelligenceViewModel: IntelligenceViewModel!
    //MARK: - Outlets
    @IBOutlet var icon: UIImageView!
    @IBOutlet var technologicalLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intelligenceViewModel = IntelligenceViewModel()
        
        // Informs the ViewModel that the View is ready to receive data.
        intelligenceViewModel.didLoad(view: self)
        
        // É a View quem determina quando vai precisar usar os dados requisitados.
        self.set()
    }
    
    
    func set() {
        // Aqui a View nem precisa saber qual o tipo da intelligenceModel
        let intelligenceModel = intelligenceViewModel.getIntView()
        
        icon.image = intelligenceModel.icon
        technologicalLabel.text = intelligenceModel.technological
        healthLabel.text = intelligenceModel.health
        languageLabel.text = intelligenceModel.language
    }
}
