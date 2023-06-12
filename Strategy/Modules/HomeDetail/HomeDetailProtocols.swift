//
//  HomeDetailProtocols.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

protocol DetailPresenterWireFrameProtocol: AnyObject {}

protocol DetailViewPresenterProtocol: AnyObject {
   func loadData()
}
protocol DetailPresenterViewProtocol: AnyObject {
    func receiveData(model: [DetailViewModel])
}

protocol DetailInteractorPresenterProtocol: AnyObject {
    func receiveData(model: [DetailViewModel])
}
protocol DetailPresenterInteractorProtocol:AnyObject {
    func getData()
}
