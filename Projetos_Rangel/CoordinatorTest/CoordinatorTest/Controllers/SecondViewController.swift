//
//  SecondViewController.swift
//  CoordinatorTest
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class{
    func navigateToFirstViewController() -> Void
    func navigateToThirdViewController() -> Void
}


class SecondViewController: UIViewController {

    
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backTofirst(_ sender: Any?){
        self.delegate?.navigateToFirstViewController()
    }

    @IBAction func goToThird(_ sender: Any?){
        self.delegate?.navigateToThirdViewController()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
