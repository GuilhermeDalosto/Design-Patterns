//
//  EmailBox.swift
//  MulticastDelegate
//
//  Created by Guilherme Martins Dalosto de Oliveira on 17/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

public protocol EmailBox{
    func notifyPeople(message: String)
    func notifyRobot(message: String)
}

public class DispatchSystem{
    let multicastDelegate = MulticastDelegate<EmailBox>()
}
