//
//  HomeDetailInteractorTests.swift
//  StrategyTests
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import XCTest
@testable import Strategy


final class HomeDetailInteractorTests: XCTestCase {
    
    func test_getDataInteractorFailed_SendEmptyArraytoPresenterFailure() throws {
        
        let presenter = SpyPresenter()
        let sut = DetailInteractor(repository: MockRepository())
        sut.presenter = presenter
        
        sut.getData()
        
        XCTAssertEqual(presenter.recieveItemsCount, 0)
    }
    
    func test_getDataInteractorFailed_SendEmptyArraytoPresenterSuccess() throws {
        
        let presenter = SpyPresenter()
        let repo = MockRepository()
        let sut = DetailInteractor(repository: repo)
        sut.presenter = presenter
        repo.numberOfReturnItems = 5
        
        sut.getData()
        
        XCTAssertEqual(presenter.recieveItemsCount, 5)
    }
    
    
    class SpyPresenter: DetailInteractorPresenterProtocol {
        private(set) var recieveItemsCount = 0
        func receiveData(model: [Strategy.DetailViewModel]) {
            recieveItemsCount = model.count
        }
    }
    
    class MockRepository: HomeDetailRepositoryProtocol {
        var delegate: Strategy.HomeDetailRepositoryDelegate?
        
        var numberOfReturnItems = 0
        
        func getPokemonList() {
            let items: [PokemonModel] = (0..<numberOfReturnItems)
                .map({ i in
                    return PokemonModel(id: i, name: "", weight: 0, height: 0, experiencia: 0, sprites: Sprites(other: Other(officialArtwork: OfficialArtwork(frontDefault: ""))))
                })
            
            delegate?.didReceive(repo: self, pokemonList: items)
        }
    }
    
}
