//
//  HomeDetailLocalRepository.swift
//  Strategy
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import Foundation

class HomeDetailLocalRepository: HomeDetailRepositoryProtocol {
    private let db = PokemonDB.shared
    var delegate: HomeDetailRepositoryDelegate?
    
    func getPokemonList() {
        print("data from db")
        if let records = db.getRecords() {
            self.delegate?.didReceive(repo: self, pokemonList: records)
        }
        else {
            self.delegate?.didFail(repo: self)
        }
    }
    
    
}
