//
//  HumanoidView.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

/// Humanoid Module View
class HumanoidView: UIViewController {
    
    private let ui = HumanoidViewUI()
    private var presenter: HumanoidPresenterProtocol!
    private var object: HumanoidEntity?
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
        presenter = HumanoidPresenter(view: self, navController: navigationController!)
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
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
        
        let humanoid = HumanoidEntity.HumanoidView(id: "8", strength: StrengthEntity.StrengthView(staticStr: staticStrLabel.text!, eccentricStr: eccentricStrLabel.text!, concentricStr: concentricStrLabel.text!, icon: iconStr.image!), intelligence: IntelligenceEntity.IntelligenceView(technological: technologicalIntLabel.text!, health: healthIntLabel.text!, language: languageIntLabel.text!, icon: iconInt.image!))
        
        presenter.store(humanoid: humanoid)
    }
    
    // MARK: - View more actions (Router)
    // Strength
    //
    @IBAction func viewMoreStr(_ sender: Any) {
        let moduleName = Constants.ModuleNames.strength
        presenter.showModule(moduleName)
//        delegate?.didPressNext(buttonName: Constants.ControllerName.strength)
    }
    
    // MARK: - View more actions (Router)
    // Intelligence
    //
    @IBAction func viewMoreInt(_ sender: Any) {
        let moduleName = Constants.ModuleNames.intelligence
        presenter.showModule(moduleName)
//        delegate?.didPressNext(buttonName: Constants.ControllerName.intelligence)
    }
}

// MARK: - extending HumanoidView to implement it's protocol
extension HumanoidView: HumanoidViewProtocol {
    
    func set(setIntelligence object: IntelligenceEntity.IntelligenceView) {
        iconInt.image = object.icon
        technologicalIntLabel.text = String(object.technological)
        healthIntLabel.text = String(object.health)
        languageIntLabel.text = String(object.language)
    }
    
    
    func set(setStrength object: StrengthEntity.StrengthView) {
        iconStr.image = object.icon
        staticStrLabel.text = object.staticStr
        eccentricStrLabel.text = object.eccentricStr
        concentricStrLabel.text = object.concentricStr
    }
    
    
    func set(setHum object: HumanoidEntity.HumanoidView) {
        idHumLabel.text = object.id
    }
}


extension HumanoidView {
    
    class func instantiate() -> HumanoidView {
        /*Como nessa view tudo é inicializado no didLoad não fazemos nada aqui.*/
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: Constants.ControllerName.humanoid)
    }
}
