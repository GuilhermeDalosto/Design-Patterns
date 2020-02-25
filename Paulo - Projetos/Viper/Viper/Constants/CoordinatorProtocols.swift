//
//  CoordinatorProtocols.swift
//  Viper
//
//  Created by Paulo Ricardo on 2/25/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation
import UIKit


protocol CoordinatorViewControllerDelegate {
    /// Usamos essa call quando temos uma coleção de viewControllers linear, iremos
    /// saber qual ViewController instanciar na implementação deste método, exemplo:
    /// didPressNext(_ vc: UIViewController)
    ///     if let vc = vcCollection(after: vc)    // perguntamos se na collection de vc's existe uma vc depois da 'vc'.
    func didPressNext(_ vc: UIViewController)
    
    /// Usamos essa quando partimos de uma Vc podemos ir para
    /// várias outras, neste casousaremos o nome do botão que foi
    /// pressionado, um botão diferente, instanciamos uma Vc diferente.
    func didPressNext(_ constantModuleName: String)
}
