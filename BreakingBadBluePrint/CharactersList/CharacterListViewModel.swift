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
    var filteredCharacters: Box<[Character]> = Box([])
    
    init() {
        fetchCharacters()
    }
    
    func filterContentForSearchText(_ searchText: String, season: Int, isSearchBarEmpty: Bool) {
        filteredCharacters.value = characters.filter { (character: Character) -> Bool in
            let doesSeasonMatch = season == 0 || character.appearance.contains(season)
            if isSearchBarEmpty {
                return doesSeasonMatch
            } else {
                return doesSeasonMatch && character.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private func fetchCharacters() {
        CharacterService.getCharacters { [weak self] (charactersData, error) in
            guard let self = self,
                let charactersData = charactersData else { return }
            
            self.characters = charactersData
            self.filteredCharacters.value = self.characters
        }
    }

}
