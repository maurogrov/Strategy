//
//  StrategyImage.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 10/06/23.
//

import UIKit

enum StrategyImage: String {
    
    case pokeball = "Pokeball"
    case strategy = "strategyIA"
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
