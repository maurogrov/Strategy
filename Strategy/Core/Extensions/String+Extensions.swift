//
//  String+Extensions.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 10/06/23.
//

import Foundation

extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
