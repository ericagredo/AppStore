//
//  SearchResult.swift
//  AppStore
//
//  Created by Eric Agredo on 5/14/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import Foundation


struct SearchResult: Decodable
{
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable
{
    let trackName: String
    let primaryGenreName: String
}
