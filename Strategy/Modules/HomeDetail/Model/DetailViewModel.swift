//
//  DetailViewModel.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 10/06/23.
//

import Foundation

struct DetailViewModel: Codable {
    let id: Int
    let title: String
    let description: String
    let tag: String
    let strUrlImage: String
    
    init(id: Int, title: String, description: String, tag: String, strUrlImage: String) {
        self.id = id
        self.title = title
        self.description = description
        self.tag = tag
        self.strUrlImage = strUrlImage
    }
    
    init(model: PokemonModel) {
        self.id = model.id
        self.title = model.name.capitalizedSentence
        self.description = "Height: \(model.height) in \nWeight: \(model.weight) oz"
        self.tag = "\(model.experiencia) experience"
        self.strUrlImage = (model.sprites.other?.officialArtwork.frontDefault)!
    }
}
