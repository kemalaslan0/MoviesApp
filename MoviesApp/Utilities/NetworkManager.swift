//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 12.12.2022.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private init () {}
    
    func download(url:URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else { return }
            guard let data = data else { return }
        }
    }
    
}
