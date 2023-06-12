//
//  HomeDetailPresenter.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import Foundation

class DetailPresenter {
    
    weak var view: DetailPresenterViewProtocol?
    var wireFrame: DetailPresenterWireFrameProtocol?
    var interactor: DetailPresenterInteractorProtocol
    
    init(
        view: DetailPresenterViewProtocol,
        wireFrame: DetailPresenterWireFrameProtocol,
        interactor: DetailPresenterInteractorProtocol) {
        self.view = view
        self.wireFrame = wireFrame
        self.interactor = interactor
    }
}

extension DetailPresenter: DetailViewPresenterProtocol {
    func loadData() {
        interactor.getData()
    }
}
extension DetailPresenter: DetailInteractorPresenterProtocol {
    func receiveData(model: [DetailViewModel]) {
        view?.receiveData(model: model)
    }
}

