//  ListPokemon.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation

struct ListPokemon: Codable {
	let count: Int?
	let next: String?
	let infos: [PokemonInfo]?

	enum CodingKeys: String, CodingKey {
		case count = "count"
		case next = "next"
		case infos = "results"
	}
}

struct PokemonInfo : Codable {
    let name : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
