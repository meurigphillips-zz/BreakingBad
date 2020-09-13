//
//  CharacterListViewModel.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 10/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    var characters = [Character]()
    var displayedCharacters: Box<[Character]> = Box([])
    var filteredSeasons = [Int]()
    
    init() {
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        CharacterService.getCharacters { [weak self] (charactersData, error) in
            guard let self = self,
                let charactersData = charactersData else { return }
            
            self.characters = charactersData
            self.displayedCharacters.value = self.characters
        }
    }

}
