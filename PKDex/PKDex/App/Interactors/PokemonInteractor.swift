//
//  PokemonInteractor.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation

struct PokemonInteractor {
    
    let didFail: (_ error: ServiceError) -> Void
    var didReceivePokemons: ((_ pokemons: [PokemonInfo]) -> Void)? = nil
    var didReceivePokemonDetail: ((_ pokemon: Pokemon) -> Void)? = nil

    let service: PokemonServiceProtocol

    func fetchPokemons(_ paginate: Int) {
        service.fetchPokemons(offset: paginate){ result in
            switch result {
            case let .success(list):
                if let pokemons = list.infos {
                    self.didReceivePokemons?(pokemons)
                    return
                }
                self.didFail(.unexpected)
            case let .failure(error):
                self.didFail(error)
            }
        }
    }
    
    func fetchPokemonDetail(for id: String) {
        service.fetchPokemonDetail(id){ result in
            switch result {
            case let .success(pokemon):
                self.didReceivePokemonDetail?(pokemon)
            case let .failure(error):
                self.didFail(error)
            }
        }
    }
}
