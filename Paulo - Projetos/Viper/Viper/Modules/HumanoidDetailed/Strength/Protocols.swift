//
//  Protocols.swift
//  Viper
//
//  Created by Paulo Ricardo on 2/23/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import Foundation


/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// HumanoidStrength Module View Protocol
protocol HumanoidStrengthViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type HumanoidStrengthEntity
    func set(object: StrengthEntity.StrengthView)
}


//MARK: Presenter -
/// HumanoidStrength Module Presenter Protocol
protocol HumanoidStrengthPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: HumanoidStrengthViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: HumanoidStrengthInteractorProtocol, didFetch object: StrengthEntity.StrengthData)
//    /// The Interactor will inform the Presenter a failed fetch.
//    func interactor(_ interactor: HumanoidStrengthInteractorProtocol, didFailWith error: Error)
}


//MARK: Interactor -
/// HumanoidStrength Module Interactor Protocol
protocol HumanoidStrengthInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: HumanoidStrengthPresenterProtocol)
}


//MARK: Router (aka: Wireframe) -
/// HumanoidStrength Module Router Protocol
protocol HumanoidStrengthRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: HumanoidStrengthEntity, parentViewController viewController: UIViewController)
}
