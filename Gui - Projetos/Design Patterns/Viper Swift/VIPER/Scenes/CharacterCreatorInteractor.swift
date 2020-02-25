//
//  CharacterCreatorInteractor.swift
//  VIPER
//
//  Created by Guilherme Martins Dalosto de Oliveira on 19/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

class CharacterCreatorInteractor : AddCharacter,FetchCharacter,FavoriteCharacter {

    var allCharacters : [Character] = []
    
    func addCharacter(character: Character?) {
        guard let char = character else {return}
        self.allCharacters.append(char)
    }
    
    func fetchCharacters() -> [Character] {
        return allCharacters
    }
    
    func favoriteCharacter(character: Character?) {
        guard var char = character else {return}
        
        for i in allCharacters{
            char.isFavorite = false
            if i.name == char.name{
                char.isFavorite = true                
            }
        }
    }
    
    
    
    
    
    
    
    
}
