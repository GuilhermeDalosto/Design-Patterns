//
//  StateController.swift
//  BankApp_MVC
//
//  Created by Rangel Cardoso Dias on 14/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation

class StateController {
    
    let storageController: StorageController!
    var accounts: [Account]!
    
    init(storageController: StorageController) {
        self.storageController = storageController
        self.accounts = self.storageController.fetchAccounts()
    }
    
    func add(_ account: Account){
        accounts.append(account)
        storageController.save(accounts)
    }
    
    func updateAccount(_ account: Account){
        for (index, accountStoraged) in accounts.enumerated() {
            if accountStoraged.number == account.number{
                accounts[index] = account
                storageController.save(accounts)
            }
        }
    }
    
}
