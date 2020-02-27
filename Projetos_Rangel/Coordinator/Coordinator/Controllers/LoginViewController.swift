//
//  LoginViewController.swift
//  Coordinator
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import UIKit
protocol LoginViewControllerDelegate: class {
     func didSuccessfullyLogin() -> Void

       func didChooseSignup() -> Void
}

class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginIn(_ sender: Any) {
        delegate?.didSuccessfullyLogin()
    }
    
    
     @IBAction func signUp(_ sender: Any) {
        delegate?.didChooseSignup()
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  
}
