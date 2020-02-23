//
//  People.swift
//  MulticastDelegate
//
//  Created by Guilherme Martins Dalosto de Oliveira on 17/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

public class Robot : EmailBox{
    
    public func notifyPeople(message: String) {
        print("Robot were notified by people -> \(message)")
    }
    
    public func notifyRobot(message: String) {
        print("Robot were notified by robot -> \(message)")
    }
    
    
}
