//
//  CCRInteractorLogic.swift
//  VIPER
//
//  Created by Guilherme Martins Dalosto de Oliveira on 20/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation


protocol AddCharacter{
    func addCharacter(character: Character?)
}

protocol FetchCharacter{
    func fetchCharacters() -> [Character]
}

protocol FavoriteCharacter{
    func favoriteCharacter(character: Character?)
}

