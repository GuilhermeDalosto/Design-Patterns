//
//  ThirdViewController.swift
//  CoordinatorTest
//
//  Created by Rangel Cardoso Dias on 21/02/20.
//  Copyright © 2020 Rangel Cardoso Dias. All rights reserved.
//

import UIKit

protocol BackToSecondViewControllerDelegate:class {
    func navigateToSecondView()->Void
}


class ThirdViewController: UIViewController {

    weak var delegate: BackToFirstViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func backToThird(_ sender: Any) {
        self.delegate?.dismissToFirstViewController()
        
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
