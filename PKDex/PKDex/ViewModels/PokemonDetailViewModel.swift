//
//  PokemonDetailViewModel.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

/// `ViewModel` responsável pela `PokemonViewController`.
final class PokemonViewModel {
    
    /// Descreve id Pokemon
    private let pokemon: Pokemon
    
    /// Descreve o coordinator.
    private let coordinator: HomeCoordinatorService
    
    /// Inicializador do ViewModel
    /// - Parameter coordinator: O coordinator controla todas as operações de navegação entre telas.
    init(_ pokemon: Pokemon, coordinator: HomeCoordinatorService) {
        self.coordinator = coordinator
        self.pokemon = pokemon
    }
    
    func getImagePokemon() -> URL? {
        let url = URL(string: pokemon.sprites.other.dreamWorld.frontDefault)
        return url
    }
    
    func getStats() -> [Stats] {
        return pokemon.stats
    }
    
    func getName() -> String {
        return pokemon.name
    }
    
    func getTypes() -> [Types] {
        return pokemon.types
    }
    
    func getAbilitiesView() -> [Abilities] {
        return pokemon.abilities
    }
    
    func getOrder() -> Int {
        return pokemon.order
    }
    
    func getSize() -> String {
        return "Peso: \(pokemon.weight)\nAltura:\(pokemon.height)"
    }
}
