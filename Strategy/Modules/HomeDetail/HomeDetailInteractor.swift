//
//  HomeDetailInteractor.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import Foundation

class DetailInteractor {
    
    weak var presenter: DetailInteractorPresenterProtocol!
    var repository: HomeDetailRepositoryProtocol
    
    init(repository: HomeDetailRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func setWidth(viewModel model: [PokemonModel]) -> [DetailViewModel] {
        let data = model.sorted(by: { $0.id < $1.id })
        var detailViewModel: [DetailViewModel] = []
        
        for model in data {
            if let _ = model.sprites.other?.officialArtwork.frontDefault {
                detailViewModel.append(DetailViewModel(model: model))
            }
        }
        return detailViewModel
    }
}

extension DetailInteractor: HomeDetailRepositoryDelegate {
 
    func didReceive(repo: HomeDetailRepositoryProtocol, pokemonList: [PokemonModel]) {
        presenter.receiveData(model: setWidth(viewModel: pokemonList))
    }
    
    func didFail(repo: HomeDetailRepositoryProtocol) {}
}

extension DetailInteractor: DetailPresenterInteractorProtocol {
    func getData() {
        repository.getPokemonList()
    }
}
