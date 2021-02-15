//
//  ListPokemonMock.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation
@testable import PKDex

final class ListPokemonMock {
    
    var pokemons: [PokemonInfo] = [PokemonInfo(name: "a"), PokemonInfo(name: "b"), PokemonInfo(name: "c")]

    private init() { }
    static func create() -> ListPokemonMock {
        return ListPokemonMock()
    }

    func make() -> ListPokemon {
        return ListPokemon(count: 3, next: "123", infos: pokemons)
    }
}
