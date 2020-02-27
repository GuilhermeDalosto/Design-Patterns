//
//  TVVController.swift
//  MVVM
//
//  Created by Guilherme Martins Dalosto de Oliveira on 24/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviewViewModel.getMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieDetail", for: indexPath) as! TVVCustomCell
        cell.title.text = Array(moviewViewModel.getMovies())[indexPath.row].key
        cell.director.text = Array(moviewViewModel.getMovies())[indexPath.row].value
        
        
        return cell
    }
    
    
    
    
    
}
