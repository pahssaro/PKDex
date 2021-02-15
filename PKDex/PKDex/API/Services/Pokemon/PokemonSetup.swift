//
//  PokemonSetup.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation
import Moya

enum PokemonSetup: ServiceSetup {
    
    case fetchPokemons(_ offset: Int)
    case fetchPokemonDetail(_ id: String)
    
    var method: Moya.Method { return .get }
    
    var endpoint: String {
        switch self {
        case let .fetchPokemons(offset):
            return "/pokemon?offset=\(offset)"
        case let .fetchPokemonDetail(id):
            return "/pokemon/\(id)"
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
