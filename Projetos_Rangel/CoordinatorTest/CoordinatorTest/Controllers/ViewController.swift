//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import UIKit


protocol FirstViewControllDelegate {
    
    func navigateToNextPage() -> Void
    
}
class ViewController: UIViewController {

    var delegate: FirstViewControllDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }


    @IBAction func nativagateNextPage(_ sender: Any) {
        
        
        self.delegate?.navigateToNextPage()
        
        
    }
}

