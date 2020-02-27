//
//  StorageController.swift
//  BankApp_MVC
//
//  Created by Rangel Cardoso Dias on 14/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation
import UIKit


class StorageController{
    
    var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    

   var accountsURL: URL {
        return documentDirectory
            .appendingPathComponent("Accounts")
            .appendingPathExtension("plist")
    }
    
    func save(_ accounts: [Account]){
        let accountPlist = accounts.map {$0.plistRepresentation} as NSArray
        do {
            try  accountPlist.write(to: self.accountsURL)
        } catch {
            print(error)
        }
       
        
    }
    
    func fetchAccounts() -> [Account] {
        guard let accountPlists = NSArray(contentsOf: accountsURL) as? [[String: AnyObject]] else {
            return []
        }
        return accountPlists.map(Account.init(plist:))
    }
}
