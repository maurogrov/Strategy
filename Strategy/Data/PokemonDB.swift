//
//  PokemonDB.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 10/06/23.
//

import CoreData
import UIKit

class PokemonDB {
    
    static let shared = PokemonDB()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var records: [PokemonModel]?
    
    init(){
        records = _getRecords()
    }
    
    public func getRecords() -> [PokemonModel]? {
        return records
    }
    
    private func _getRecords() -> [PokemonModel]? {
        guard Thread.isMainThread else { fatalError("main thread") }
        
        let fetch = PokemonDBNS.fetchRequest()
        
        guard let results = try? context.fetch(fetch),
              let records = results.first,
              let data = records.dataBin else { return nil }
        
        let decoder = JSONDecoder()
        let record = try? decoder.decode([PokemonModel].self, from: data)
        
        return record
    }
    
    public func setRecords(newRecords: [PokemonModel]) throws {
        guard Thread.isMainThread else { fatalError("main thread") }

        _deleteRecords()

        let encoder = JSONEncoder()
        let newData = PokemonDBNS(context: context)

        do {
            let data = try encoder.encode(newRecords)
            newData.dataBin = data
            try context.save()
            records = _getRecords()
            
        } catch {
            debugPrint(error)
        }
    }
   
    internal func _deleteRecords() {
        guard Thread.isMainThread else { fatalError("main thread") }
        do {
            let fetch = PokemonDBNS.fetchRequest()
            let results = try context.fetch(fetch)
            results.forEach({ context.delete($0) })
            try context.save()
        } catch {
            debugPrint(error)
        }
    }
    
    
}

