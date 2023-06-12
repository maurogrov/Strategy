//
//  HomeDetailApiRepository.swift
//  Strategy
//
//  Created by Mauricio Guerrero on 11/06/23.
//

import Foundation

class HomeDetailApiRepository: HomeDetailRepositoryProtocol {
    
    var delegate: HomeDetailRepositoryDelegate?
    
    let urlStr: String = "https://pokeapi.co/api/v2/pokemon/"
    
    internal func buildUrls(startWithId id: Int) -> [URL]{
        let askNumberRecords = 20
        var urls: [URL] = []
        for index in id...id + askNumberRecords - 1 {
            let urlStr = "\(urlStr)\(index)"
            guard let url = URL(string: urlStr) else {continue}
            urls.append(url)
        }
        return urls
    }
    
    func getPokemonList() {
        
        print("data from api")
        var objects: [PokemonModel] = []
        let urls = buildUrls(startWithId: 1)
        
        //Warning concurrent, overload system MG.
        DispatchQueue(label: "com.queue.serial").async {
            let downloadGroup = DispatchGroup()
            
            urls.forEach {
                downloadGroup.enter()
                
                PokemonService.downloadData(url: $0) { (model: PokemonModel?) in
                    if let entity = model {
                        objects.append(entity)
                    }
                    downloadGroup.leave()
                }
            }
            downloadGroup.wait()
            DispatchQueue.main.async {
                let db = PokemonDB.shared
                try? db.setRecords(newRecords: objects)
                self.delegate?.didReceive(repo: self, pokemonList: objects)
            }
        }
    }
}
