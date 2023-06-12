//
//  HomeProtocols.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

protocol HomePresenterWireFrameProtocol: AnyObject {
    func presentDetail(from view: HomePresenterViewProtocol)
}

protocol HomePresenterViewProtocol: AnyObject {}
protocol HomeViewPresenterProtocol: AnyObject {
    func goTo(_ view: HomeViews)
}

protocol HomeInteractorPresenterProtocol: AnyObject {}
protocol HomePresenterInteractorProtocol: AnyObject {}






