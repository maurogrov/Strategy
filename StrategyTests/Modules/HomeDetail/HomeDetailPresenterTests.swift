//
//  HomeDetailPresenterTests.swift
//  StrategyTests
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import XCTest
@testable import Strategy

final class HomeDetailPresenterTests: XCTestCase {

    func test_viewLoadData_presenterFailsLoadingData_presenterNotifyView() throws {
        
        let view = SpyView()
        let interactor = FakeInteractor()
        let sut = DetailPresenter(
            view: view,
            wireFrame: MockWireframe(),
            interactor: interactor
        )

        view.presenter = sut
        interactor.presenter = sut
        interactor.shouldFail = true
        
        // Simulate view asking for data
        sut.loadData()
        
        XCTAssertTrue(view.didEnterRecieveData)
        XCTAssertTrue(view.didFailed)
    }
    
    func test_viewLoadsData_presenterLoadsData_presenterNotifyView() throws {
        let view = SpyView()
        let interactor = FakeInteractor()
        let sut = DetailPresenter(
            view: view,
            wireFrame: MockWireframe(),
            interactor: interactor
        )
        
        view.presenter = sut
        interactor.presenter = sut
        interactor.shouldFail = false
        
        // Simulate view asking for data
        sut.loadData()
        
        XCTAssertTrue(view.didEnterRecieveData)
        XCTAssertFalse(view.didFailed)
    }
    
    class SpyView: DetailPresenterViewProtocol {
        
        var presenter: DetailViewPresenterProtocol!
        
        var didEnterRecieveData = false
        var didFailed = false
        
        func receiveData(model: [DetailViewModel]) {
            didEnterRecieveData = true
            didFailed = model.isEmpty
        }
        
        func askForData() {
            presenter.loadData()
        }
    }
    
    class FakeInteractor: DetailPresenterInteractorProtocol {
        
        weak var presenter: DetailInteractorPresenterProtocol!
        
        var shouldFail = false
        func getData() {
            if shouldFail {
                presenter?.receiveData(model: [])
            } else {
                let data = [
                    DetailViewModel(model: PokemonModel(id: 1, name: "", weight: 0, height: 0, experiencia: 0, sprites: Sprites(other: Other(officialArtwork: OfficialArtwork(frontDefault: "")))))
                ]
                presenter?.receiveData(model: data)
            }
        }
    }
    
    class MockWireframe: DetailPresenterWireFrameProtocol {}
    
}
