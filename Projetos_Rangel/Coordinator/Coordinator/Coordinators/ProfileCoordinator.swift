//
//  ProfileCoordinator.swift
//  Coordinator
//
//  Created by Rangel Cardoso Dias on 23/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation
protocol ProfileCoordinatorDelegate: class {
    
}


class ProfileCoordinator: Coordinator {
    
    weak var delegate: ProfileCoordinatorDelegate?

    
    override func start() {
        let vc = ProfileViewController()
        //seto o delegate aqui
        self.navigationController.show(vc, sender: self)
    }
}


