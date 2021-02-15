//
//  PokemonService.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation
import Moya

protocol PokemonServiceProtocol {
    func fetchPokemons(offset: Int, completion: @escaping (Result<ListPokemon, ServiceError>) -> Void)
    func fetchPokemonDetail(_ id: String, completion: @escaping (Result<Pokemon, ServiceError>) -> Void)
}

struct PokemonService: BaseService, PokemonServiceProtocol {
    
    typealias Service = PokemonSetup
        
    func fetchPokemons(offset: Int, completion: @escaping (Result<ListPokemon, ServiceError>) -> Void) {
        let service = Service.fetchPokemons(offset)
         provider.request(service) { result in
           completion(self.handle(result: result, converter: ObjectResponseConverter<ListPokemon>(), service: service))
        }
    }
    
    func fetchPokemonDetail(_ id: String, completion: @escaping (Result<Pokemon, ServiceError>) -> Void) {
        let service = Service.fetchPokemonDetail(id)
         provider.request(service) { result in
           completion(self.handle(result: result, converter: ObjectResponseConverter<Pokemon>(), service: service))
        }
    }
}
