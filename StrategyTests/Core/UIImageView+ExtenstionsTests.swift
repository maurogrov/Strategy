//
//  UIImageView+ExtenstionsTests.swift
//  StrategyTests
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import XCTest
@testable import Strategy

final class UIImageView_ExtenstionsTests: XCTestCase {
    
    let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"
    let badUrl = "example. com"
    
    var imageTestView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func test_DownloadImage_False() throws {
        imageTestView.loadFrom(URLAddress: badUrl) { x in
            XCTAssertFalse(x)
        }
    }

    func test_DownloadImage_True() throws {
        imageTestView.loadFrom(URLAddress: url) { x in
            XCTAssert(x)
        }
    }
}
