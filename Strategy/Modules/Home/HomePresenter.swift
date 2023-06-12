//
//  HomePresenter.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import Foundation

class HomePresenter {
    weak var view: HomePresenterViewProtocol?
    var wireFrame: HomePresenterWireFrameProtocol
    var interactor: HomePresenterInteractorProtocol
    
    internal init(
        view: HomePresenterViewProtocol,
        wireFrame:HomePresenterWireFrameProtocol,
        interactor: HomePresenterInteractorProtocol){
            self.view = view
            self.wireFrame = wireFrame
            self.interactor = interactor
        }
}

extension HomePresenter: HomeViewPresenterProtocol {
    
    func goTo(_ view: HomeViews) {
        switch view {
        case .Detail:
            wireFrame.presentDetail(from: self.view!)
        }
    }
}

extension HomePresenter: HomeInteractorPresenterProtocol { }
