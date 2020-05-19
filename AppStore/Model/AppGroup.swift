//
//  AppGroup.swift
//  AppStore
//
//  Created by Eric Agredo on 5/17/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
