//
//  HomeInteractor.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import Foundation

class HomeInteractor {
    weak var presenter: HomeInteractorPresenterProtocol!
}

extension HomeInteractor: HomePresenterInteractorProtocol {}
