//
//  NewTransactionView.swift
//  BankApp_MVC
//
//  Created by Rangel Cardoso Dias on 14/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import Foundation
import UIKit

class NewTransactionView: UIView {
  
    @IBOutlet weak var amountTextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    let pickerData: [TransactionCategory] = [.fun,.groceries,.home,.income,.transport,.utilities]
    
    var amount: Float? {
        guard let text = amountTextField.text else {
            return nil
        }
        return Float(text)
    }
    
    var transactionDescription: String? {
        return descriptionTextField.text
    }
    
    var selectedCategory: TransactionCategory{
        return pickerData[categoryPickerView.selectedRow(inComponent: 0)]
    }
    
    override func didMoveToSuperview() {
        self.categoryPickerView.delegate = self
        self.categoryPickerView.dataSource = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension NewTransactionView: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].rawValue
    }
    
    
}
