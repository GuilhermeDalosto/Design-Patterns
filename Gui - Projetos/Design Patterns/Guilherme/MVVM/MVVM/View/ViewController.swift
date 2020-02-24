//
//  ViewController.swift
//  MVVM
//
//  Created by Guilherme Martins Dalosto de Oliveira on 24/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let moviewViewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }
    
    func display(viewModel: MovieViewModel){
        
    }
    
}



