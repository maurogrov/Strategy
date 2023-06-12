//
//  HomeViewTests.swift
//  StrategyTests
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import XCTest
@testable import Strategy

final class HomeViewTests: XCTestCase {

    func test_viewConnectionPresenter_presenterFail_presenterConnection() throws {
        
        let sut = HomeView()
        let presenter = FakePresenter(view: sut)
        sut.presenter = nil
        
        sut.viewDidLoad()
        sut.didTapOnCreateRequest()
        
        XCTAssertEqual(presenter.isConnection, false)
    }
    
    func test_viewConnectionPresenter_presenter_presenterConnection() throws {
        
        let sut = HomeView()
        let presenter = FakePresenter(view: sut)
        sut.presenter = presenter
        
        sut.viewDidLoad()
        sut.didTapOnCreateRequest()
        
        XCTAssertEqual(presenter.isConnection, true)
    }
    
  
    
    class FakePresenter: HomeViewPresenterProtocol {
      
        weak var view: HomePresenterViewProtocol!
        var isConnection = false
        
        internal init(view: HomePresenterViewProtocol){
            self.view = view
        }
        
        func goTo(_ view: Strategy.HomeViews) {
            isConnection = true
        }
    }

}

