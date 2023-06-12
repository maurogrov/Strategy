//
//  PokemonService.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import Foundation

class PokemonService {
    
    static func downloadData<T:Codable>(url: URL, completionData: @escaping (T?) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                if let error = error {
                    print("Error en la operación \(error), NT001")
                }
                return
            }
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(T.self, from: data)
                    completionData(object)
                }
                catch let error {
                    print("\(error.localizedDescription)")
                    completionData(nil)
                }
            } else {
                print("Error \(response.statusCode)")
                completionData(nil)
            }
        }.resume()
    }
}
