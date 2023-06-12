//
//  UIImageView+Extensions.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

extension UIImageView {
    
    func loadFrom(URLAddress: String, completion: ((Bool) -> Void)? = nil) {
        
        guard let url = URL(string: URLAddress) else {
            completion?(false)
            return
        }
        
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            completion?(true)
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
}
