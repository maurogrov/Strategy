//
//  HomeDetailWireFrame.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//
import UIKit

class DetailWireFrame: WireFrameProtocol, DetailPresenterWireFrameProtocol {
    
    func createModule() -> UIViewController {
        
        let view = HomeDetailView()
        let repository = HomeDetailRepositoryWithFallback(
            principalRepo: HomeDetailLocalRepository(),
            secondaryRepo: HomeDetailApiRepository())
        let interactor = DetailInteractor(repository: repository)
        
        let presenter = DetailPresenter(
            view: view,
            wireFrame: self,
            interactor: interactor)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
}

