//
//  HumanoidViewUI.swift
//  Viper
//
//  Created Paulo Ricardo on 2/22/20.
//  Copyright © 2020 Paulo Ricardo. All rights reserved.
//

import UIKit

// MARK: HumanoidViewUI Delegate -
/// HumanoidViewUI Delegate
protocol HumanoidViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: HumanoidViewUI Data Source -
/// HumanoidViewUI Data Source
protocol HumanoidViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: HumanoidViewUI) -> HumanoidEntity
}

class HumanoidViewUI: UIView {
    
    var delegate: HumanoidViewUIDelegate?
    var dataSource: HumanoidViewUIDataSource?
    
    var object : HumanoidEntity?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        // Should update UI
    }
}
