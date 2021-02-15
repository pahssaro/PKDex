//
//  Pokemon.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
	let id: Int
	let name: String
	let sprites: Sprites
	let stats: [Stats]
	let types: [Types]
    let abilities: [Abilities]
    let order: Int
    let weight: Int
    let height: Int
    
	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case sprites = "sprites"
		case stats = "stats"
		case types = "types"
        case abilities = "abilities"
        case order = "order"
        case weight = "weight"
        case height = "height"
	}
}


// MARK: - Sprites
struct Sprites: Codable {
    let other: Other

    enum CodingKeys: String, CodingKey {
        case other = "other"
    }
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "official-artwork"
    }
}

// MARK: - DreamWorld
struct DreamWorld : Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stats
struct Stats: Codable {
    let baseStat: Int
    let stat: Stat

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat = "stat"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

// MARK: - Types
struct Types: Codable {
    let type: Type

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }
}

// MARK: - Type
struct Type: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Abilities : Codable {
    let ability : Ability?
    let is_hidden : Bool?
    let slot : Int?

    enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case is_hidden = "is_hidden"
        case slot = "slot"
    }

}

struct Ability : Codable {
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }

}
