//
//  ViewController.swift
//  MulticastDelegate
//
//  Created by Guilherme Martins Dalosto de Oliveira on 17/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dispatch = DispatchSystem()
    var people : People! = People()
    var robot : Robot! = Robot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatch.multicastDelegate.addDelegate(people)
        dispatch.multicastDelegate.addDelegate(robot)
        
        dispatch.multicastDelegate.invokeDelegates {
            $0.notifyPeople(message: "Help")
        }
        
    }
    
    


}

