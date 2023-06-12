//
//  HomeDetailViewTests.swift
//  StrategyTests
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import XCTest
@testable import Strategy

final class HomeDetailViewTests: XCTestCase {
    

    

    func test_viewReceiveData_presenterFails_presenterNotifyView() throws {
        
        let sut = HomeDetailView()
        let presenter = FakePresenter(view: sut)
        presenter.shouldFail = true
        
        presenter.loadData()
        
        
        XCTAssertEqual(sut.dataList.count, 0)
    }
    
    func test_viewReceiveData_presenter_presenterNotifyView() throws {
        
        let sut = HomeDetailView()
        let presenter = FakePresenter(view: sut)
        
        presenter.shouldFail = false
        sut.presenter = presenter
        
        presenter.loadData()
      
        
        XCTAssertEqual(sut.dataList.count, 1)
    }
    
    class FakePresenter: DetailViewPresenterProtocol {
        
        weak var view: DetailPresenterViewProtocol!
        var shouldFail = false
        
        internal init(view: DetailPresenterViewProtocol) { self.view = view }
        
        func loadData() {
            if shouldFail {
                view.receiveData(model: [])
            } else {
                view.receiveData(model: [
                    DetailViewModel(id: 0, title: "", description: "", tag: "", strUrlImage: "")
                ])
            }
        }
    }


}
