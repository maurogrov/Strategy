//
//  HomeDetailRepositoryWithFallback.swift
//  Strategy
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import Foundation

protocol HomeDetailRepositoryProtocol: AnyObject {
    var delegate: HomeDetailRepositoryDelegate? { get set }
    func getPokemonList()
}
protocol HomeDetailRepositoryDelegate {
    func didReceive(repo: HomeDetailRepositoryProtocol, pokemonList: [PokemonModel])
    func didFail(repo: HomeDetailRepositoryProtocol)
}

class HomeDetailRepositoryWithFallback: HomeDetailRepositoryProtocol, HomeDetailRepositoryDelegate {
    
    init(
        principalRepo: HomeDetailRepositoryProtocol,
        secondaryRepo: HomeDetailRepositoryProtocol) {
            
        self.principalRepo = principalRepo
        self.secondaryRepo = secondaryRepo
        
        self.principalRepo.delegate = self
        self.secondaryRepo.delegate = self
    }
    
    var delegate: HomeDetailRepositoryDelegate?
    let principalRepo: HomeDetailRepositoryProtocol
    let secondaryRepo: HomeDetailRepositoryProtocol
    
    func getPokemonList() {
        principalRepo.getPokemonList()
    }
    
    func didReceive(repo: HomeDetailRepositoryProtocol, pokemonList: [PokemonModel]) {
        self.delegate?.didReceive(repo: self, pokemonList: pokemonList)
    }
    
    func didFail(repo: HomeDetailRepositoryProtocol) {
        if repo === principalRepo {
            self.secondaryRepo.getPokemonList()
        } else {
            self.delegate?.didFail(repo: self)
        }
    }
}
