//
//  Transaction.swift
//  BankApp_MVC
//
//  Created by Rangel Cardoso Dias on 14/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation




enum TransactionCategory: String{
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}


struct Transaction {
    let balance: Float
    let description: String
    let date: Date
    let category: TransactionCategory
}

//outro exemplo como a lógica e transformação do objeto deve ficar na model
extension Transaction{
    
    var plistRepresentation: [String: AnyObject]{
        return ["balance" : balance as AnyObject, "description" : description as AnyObject, "date" : date as AnyObject, "category" : category.rawValue as AnyObject]
    }
    
    
    init(plist: [String: AnyObject]) {
        balance = plist["balance"] as! Float
        description = plist["description"] as! String
        date = plist["date"] as! Date
        category = TransactionCategory(rawValue: plist["category"] as! String)!
    }
}
