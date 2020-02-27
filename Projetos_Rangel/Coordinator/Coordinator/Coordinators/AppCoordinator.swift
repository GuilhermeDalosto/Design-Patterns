//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//
/*
 OBS: A NavigationController não está costumizada, portanto o back button não está funcionando, num projeto real temos q sobrescrever essse método para que ele funcione com os coordinators
 */
import Foundation
import UIKit

class Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    func start(){
        
    }
    init(with navigationController: UINavigationController) {
          self.navigationController = navigationController
      }
}

class AppCoordinator: Coordinator {
    
    private var isLogged = false
    
    
    
    override init(with navigationController: UINavigationController) {
        super.init(with: navigationController)
    }
    
    
    
    override func start(){
        if isLogged{
            showProfile()
        }else{
            showAutheticate()
        }
    }
    
    
    
    
    func showProfile(){
        let profileCoordinator = ProfileCoordinator(with: self.navigationController)
        profileCoordinator.delegate = self
        profileCoordinator.start()
        childCoordinators.append(profileCoordinator)
    }
    
    func showAutheticate(){
        let authetucation = AuthenticationCoordinator(with: self.navigationController)
        authetucation.delegate = self
        authetucation.start()
        childCoordinators.append(authetucation)
    }
}


extension AppCoordinator: AuthenticationCoordinatorDelegate{
    
    
    func coordinatorDidAuthenticate(coordinator: AuthenticationCoordinator) {
        removeCoordinator(coordinator: coordinator)
        self.showProfile()
    }
    
     fileprivate func removeCoordinator(coordinator:Coordinator) {

         var idx:Int?
         for (index,value) in childCoordinators.enumerated() {
             if value === coordinator {
                 idx = index
                 break
             }
         }

         if let index = idx {
             childCoordinators.remove(at: index)
         }

     }
    
    
}

extension AppCoordinator: ProfileCoordinatorDelegate{
    
}
