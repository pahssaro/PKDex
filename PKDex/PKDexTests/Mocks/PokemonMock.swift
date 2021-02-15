//
//  PokemonMock.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation
@testable import PKDex



final class PokemonMock {
    
    private var sprites: Sprites = Sprites(other: Other(dreamWorld: DreamWorld(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png")))
    private var stats: [Stats] = [Stats(baseStat: 35, stat: Stat(name: "hp")),
                                  Stats(baseStat: 100, stat: Stat(name: "attack")),
                                  Stats(baseStat: 50, stat: Stat(name: "defense")),
                                  Stats(baseStat: 50, stat: Stat(name: "special-attack")),
                                  Stats(baseStat: 70, stat: Stat(name: "special-defense")),
                                  Stats(baseStat: 120, stat: Stat(name: "speed"))]
    private var types: [Types] = [Types(type: Type(name: "ground"))]
    private var abilities: [Abilities] = [Abilities(ability: Ability(name: "sand-veil", url: "https://pokeapi.co/api/v2/ability/8/"), is_hidden: false, slot: 1),
                                          Abilities(ability: Ability(name: "arena-trap", url: "https://pokeapi.co/api/v2/ability/71/"), is_hidden: false, slot: 2),
                                          Abilities(ability: Ability(name: "sand-force", url: "https://pokeapi.co/api/v2/ability/159/"), is_hidden: true, slot: 3)]

    private init() { }
    static func create() -> PokemonMock {
        return PokemonMock()
    }

    func make() -> Pokemon {
        return Pokemon(id: 51, name: "dugtrio", sprites: sprites, stats: stats, types: types, abilities: abilities, order: 84, weight: 333, height: 7)
    }
}
