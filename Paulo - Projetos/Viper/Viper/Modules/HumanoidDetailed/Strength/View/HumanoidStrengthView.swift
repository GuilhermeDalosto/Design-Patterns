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
    
    /// Usamos essa variável para guardar dados que estão vindo de outra view.
    /// Algumas vezes quando inicializamos essa ViewController pelo Router, o router termina sua execução
    /// antes dessa viewDidLoad() retornar, por isso não podemos setar os dados diretamente da Router, em
    /// vez disso, guardamos os dados passados nessa variável para só assim eles serem setados no fim da didLoad()
    private var object: StrengthEntity.StrengthView?
    
    //MARK: - Outlets
    @IBOutlet var icon: UIImageView!
    @IBOutlet var staticStrLabel: UILabel!
    @IBOutlet var eccentricStrLabel: UILabel!
    @IBOutlet var concentricStrLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        set()
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
    
    
    func sendData(object: StrengthEntity.StrengthView) {
        self.object = object
    }
    
    
    func set() {
        icon.image = object?.icon
        staticStrLabel.text = object?.staticStr
        eccentricStrLabel.text = object?.eccentricStr
        concentricStrLabel.text = object?.concentricStr
    }
}


extension HumanoidStrengthView {
    
    class func instantiate() -> HumanoidStrengthView {
        /*Como nessa view tudo é inicializado no didLoad não fazemos nada aqui.*/
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: Constants.ControllerName.strength)
    }
}
