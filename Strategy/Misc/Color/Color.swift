//
//  Color.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

enum ColorStrategy: String {
    case BackgroundLayerOne
    case BackgroundLayerTwo
    case BackgroundLayerThree
    case ButtonLayerOne
    case TextColorLayerOne
    case TextColorLayerTwo
    case TextColorLayerThree
        
    var color: UIColor {
        return UIColor(named: self.rawValue)!
    }
    
    var cgColor: CGColor {
        color.cgColor
    }

}
