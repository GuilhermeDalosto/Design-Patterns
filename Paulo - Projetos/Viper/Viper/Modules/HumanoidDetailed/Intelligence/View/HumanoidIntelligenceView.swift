//
//  HumanoidIntelligenceView.swift
//  Viper
//
//  Created Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// HumanoidIntelligence Module View
class HumanoidIntelligenceView: UIViewController {
    
    private var presenter: HumanoidIntelligencePresenterProtocol!
    
    private var object : IntelligenceEntity.IntelligenceView?
    
    //MARK: - Outlets
    @IBOutlet var icon: UIImageView!
    @IBOutlet var technologicalLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HumanoidIntelligencePresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending HumanoidIntelligenceView to implement it's protocol
extension HumanoidIntelligenceView: HumanoidIntelligenceViewProtocol {
    
    // Chamado pelo presenter
    func set(object: IntelligenceEntity.IntelligenceView) {
        icon.image = object.icon
        technologicalLabel.text = object.technological
        healthLabel.text = object.health
        languageLabel.text = object.language
    }
}
