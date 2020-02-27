//
//  AutheticationCoordinator.swift
//  Coordinator
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//


protocol AuthenticationCoordinatorDelegate:class {
    func coordinatorDidAuthenticate(coordinator: AuthenticationCoordinator)
}

import Foundation
import UIKit

final class AuthenticationCoordinator: Coordinator{
    
    
   
    
   
    weak var delegate: AuthenticationCoordinatorDelegate?
    let loginViewController: LoginViewController

    override init(with navigationController: UINavigationController) {
        self.loginViewController = LoginViewController()
        super.init(with: navigationController)
    }

    override func start() {
        showLoginViewController()
    }
       
    func showLoginViewController(){
        loginViewController.delegate = self
        navigationController.show(loginViewController, sender: self)
    }
    func showSignUPViewController(){
        let signVC = SignUpViewController()
        signVC.delegate = self
        navigationController.show(signVC, sender: self)
    }
    
    func showPassWordViewController(){
        let passwordVC = PassWordViewController()
        passwordVC.delegate = self
        navigationController.show(passwordVC, sender: self)
    }
    
}

extension AuthenticationCoordinator: LoginViewControllerDelegate{
    func didSuccessfullyLogin() {
        delegate?.coordinatorDidAuthenticate(coordinator: self)
    }
    
    func didChooseSignup() {
        showSignUPViewController()
    }
    
    
}

extension AuthenticationCoordinator: SignupViewControllerDelegate{
    func goToCreatePassWord() {
        showPassWordViewController()
    }
    
    
}
extension AuthenticationCoordinator: PasswordViewControllerDelegate{
    
    //como eu vou mudar de sessão no app agora, instanciamos o novo coordinator que será responsável pela mesma
    func goToProfileView() {
        let profileCoo = ProfileCoordinator(with: self.navigationController)
        profileCoo.start()
        childCoordinators.append(profileCoo)
    }
    
    
}
