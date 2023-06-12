//
//  PokemonServiceTests.swift
//  StrategyTests
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import XCTest
@testable import Strategy

final class PokemonServiceTests: XCTestCase {
    
    let url =  URL(string: "https://pokeapi.co/api/v2/pokemon/1")
    let badUrl =  URL(string: "https://pokeapi.co/api/v2/pokemon/x")

    func test_DownloadData_True() throws {
        PokemonService.downloadData(url: url!) { (model: PokemonModel?) in
            if let _ = model {
                XCTAssert(true)
            }
        }
    }
    
    func test_DownLoadData_Fail() throws {
        PokemonService.downloadData(url: badUrl!) { (model: PokemonModel?) in
            if model == nil {
                XCTAssert(true)
            }
        }
    }
    
    func test_DownLoadData_FailEntity() throws {
        PokemonService.downloadData(url: url!) { (model: PokemonModelMock?) in
            if model == nil {
                XCTAssert(true)
            }
        }
    }
    
    struct PokemonModelMock: Codable {
        let id: Int
        let nameWrong: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case nameWrong
        }
    }

}
