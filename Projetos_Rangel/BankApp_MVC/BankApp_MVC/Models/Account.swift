//
//  Account.swift
//  BankApp_MVC
//
//  Created by Rangel Cardoso Dias on 14/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation

struct Account {
    let name: String
    let bank: String
    let number: String
    var transactions: [Transaction]
    
    
    //aqui temos um exemplo de como a lógica deve ficar dentro da model e não na viu controller
    var total: Float {
        return transactions.reduce(0.0, { $0 + $1.balance * ($1.category == .income ? 1 : -1) })
    }
    
    
    

}

extension Account {
    var plistRepresentation: [String: AnyObject] {
        return [
            "name": name as AnyObject,
            "bank": bank as AnyObject,
            "number": number as AnyObject,
            "transactions": transactions.map { $0.plistRepresentation } as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        name = plist["name"] as! String
        bank = plist["bank"] as! String
        number = plist["number"] as! String
        transactions = (plist["transactions"] as! [[String: AnyObject]]).map(Transaction.init(plist:))
    }
}
