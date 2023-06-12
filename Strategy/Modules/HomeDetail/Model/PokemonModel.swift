//
//  PokemonModel.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import Foundation

struct PokemonModel: Codable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let experiencia: Int
    let sprites: Sprites
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case height
        case experiencia = "base_experience"
        case sprites
    }
}

struct Sprites: Codable {
    let other: Other?
    enum CodingKeys: String, CodingKey {
        case other
    }
}
struct Other: Codable {
    let officialArtwork: OfficialArtwork
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

