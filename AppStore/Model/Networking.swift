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
    func fetchItunesApps(searchText: String, completion: @escaping (SearchResult?, Error?) -> Void)
    {
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        print(urlString)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGroup(group: String, completion: @escaping (AppGroup?, Error?) -> ())
    {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/\(group)/all/50/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
           
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
           let urlString = "https://api.letsbuildthatapp.com/appstore/social"
           fetchGenericJSONData(urlString: urlString, completion: completion)
       }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?)->Void)
    {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}
