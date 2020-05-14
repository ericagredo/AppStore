//
//  Networking.swift
//  AppStore
//
//  Created by Eric Agredo on 5/14/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import Foundation

struct Network
{
    static let shared = Network()
    private init()
    {
        
    }
    func fetchItunesApps(completion: @escaping ([Result], Error?) -> Void)
    {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err
            {
                print("Failed to fecth apps:", err)
                completion([],err)
                return
            }
            guard let data = data else { return }
            
            do
            {
                let responses = try JSONDecoder().decode(SearchResult.self, from: data).results
                completion(responses,nil)
                responses.forEach{print($0.trackName, $0.primaryGenreName)}
            }
            catch let errResponse
            {
                completion([],err)
                print("There was an error decoding", errResponse)
            }
            
        }.resume()
    }
}
