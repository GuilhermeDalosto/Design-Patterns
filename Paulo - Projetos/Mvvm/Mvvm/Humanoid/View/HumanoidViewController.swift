//
//  HumanoidViewController.swift
//  Mvvm
//
//  Created by Paulo Ricardo on 2/24/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit

/// Humanoid Module View
class HumanoidViewController: UIViewController {
    
    private var viewModel: HumanoidViewModel!
    // MARK: - Outlets
    // Strength:
    @IBOutlet var staticStrLabel: UILabel!
    @IBOutlet var eccentricStrLabel: UILabel!
    @IBOutlet var concentricStrLabel: UILabel!
    @IBOutlet var iconStr: UIImageView!
    // Intelligence:
    @IBOutlet var technologicalIntLabel: UILabel!
    @IBOutlet var healthIntLabel: UILabel!
    @IBOutlet var languageIntLabel: UILabel!
    @IBOutlet var iconInt: UIImageView!
    // Humanoid:
    @IBOutlet var idHumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HumanoidViewModel()
        
        // Informs the Presenter that the View is ready to receive data.
        viewModel.didLoad(view: self)
        
        // É a View quem determina quando vai precisar usar os dados requisitados.
        self.setStrength()
        self.setInte()
        self.setHuman()
    }
    
    
    func setStrength() {
        let strengthView = viewModel.getStrength()
        
        iconStr.image = strengthView.icon
        staticStrLabel.text = strengthView.staticStr
        eccentricStrLabel.text = strengthView.eccentricStr
        concentricStrLabel.text = strengthView.concentricStr
    }
    
    
    func setInte() {
        let intelligenceView = viewModel.getIntelligence()
        
        iconInt.image = intelligenceView.icon
        technologicalIntLabel.text = intelligenceView.technological
        healthIntLabel.text = intelligenceView.health
        languageIntLabel.text = intelligenceView.language
    }
    
    
    func setHuman() {
        let humanoidView = viewModel.getHumanoid()
        
        idHumLabel.text = humanoidView.id
    }
    
    
    // MARK: - IBActions
    // Strength increase:
    //
    @IBAction func staticPlus(_ sender: Any) {
        
        var value: Int! = Int(staticStrLabel.text!)
        value += 1
        staticStrLabel.text = String(value)
    }
    
    
    @IBAction func eccentricPlus(_ sender: Any) {
        
        var value: Int! = Int(eccentricStrLabel.text!)
        value += 1
        eccentricStrLabel.text = String(value)
    }
    
    
    @IBAction func concentricPlus(_ sender: Any) {
        
        var value: Int! = Int(concentricStrLabel.text!)
        value += 1
        concentricStrLabel.text = String(value)
    }
    
    //
    // Intelligence increase:
    //
    @IBAction func technologicalPlus(_ sender: Any) {
        
        var value: Int! = Int(technologicalIntLabel.text!)
        value += 1
        technologicalIntLabel.text = String(value)
    }
    
    
    @IBAction func healthPlus(_ sender: Any) {
        
        var value: Int! = Int(healthIntLabel.text!)
        value += 1
        healthIntLabel.text = String(value)
    }
    
    
    @IBAction func languagePlus(_ sender: Any) {
        
        var value: Int! = Int(languageIntLabel.text!)
        value += 1
        languageIntLabel.text = String(value)
    }
    
    //
    // Save (call Presenter)
    //
    @IBAction func save(_ sender: Any) {
        
        let _ = HumanoidModel.HumanoidView(id: "8", strength: StrengthModel.StrengthView(staticStr: staticStrLabel.text!, eccentricStr: eccentricStrLabel.text!, concentricStr: concentricStrLabel.text!, icon: iconStr.image!), intelligence: IntelligenceModel.IntelligenceView(technological: technologicalIntLabel.text!, health: healthIntLabel.text!, language: languageIntLabel.text!, icon: iconInt.image!))
        
        viewModel.storeHumanoid()
    }
    
    // MARK: - View more actions (Router)
    // Strength
    //
    @IBAction func viewMoreStr(_ sender: Any) {
        let moduleName = Constants.ModuleNames.strength
        viewModel.showModule(moduleName, parentView: self)
    }
    
    // MARK: - View more actions (Router)
    // Intelligence
    //
    @IBAction func viewMoreInt(_ sender: Any) {
        let moduleName = Constants.ModuleNames.intelligence
        viewModel.showModule(moduleName, parentView: self)
    }
}
