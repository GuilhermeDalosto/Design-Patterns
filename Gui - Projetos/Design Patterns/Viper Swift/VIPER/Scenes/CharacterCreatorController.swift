//
//  CharacterCreatorController.swift
//  VIPER
//
//  Created by Guilherme Martins Dalosto de Oliveira on 19/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class CharacterCreatorController : UIViewController{
    
    var presenter = CharacterCreatorPresenter()
    var router = CharacterCreatorRouter()
    var interactor = CharacterCreatorInteractor()
    
    
    override func viewDidLoad() {
        presenter.displayMessage()
        
  //      router.changeView(identifier: "segueToMain")
        let person = Character(name: "Gui", level: 2, isFavorite: false)
        interactor.addCharacter(character: person)
        print(interactor.allCharacters[0])
     //   print(interactor.allCharacters[0].description)
        print(interactor.fetchCharacters())
    }
    
    
    
}
