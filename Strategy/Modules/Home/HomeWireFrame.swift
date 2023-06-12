//
//  HomeWireFrame.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

enum HomeViews {
    case Detail
}
protocol WireFrameProtocol {
    func createModule() -> UIViewController
}

class HomeWireFrame: WireFrameProtocol, HomePresenterWireFrameProtocol {
    
    func createModule() -> UIViewController {
        
        let view = HomeView()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(
            view: view,
            wireFrame: self,
            interactor: interactor)
        
        //WEAKS
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func presentDetail(from view: HomePresenterViewProtocol) {
        let detailView = DetailWireFrame().createModule()
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
