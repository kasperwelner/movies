//
//  Movie.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import Foundation

struct Movie : Codable {
    
    struct ExternalIds : Codable {
        let imdbId: String?
        let facebookId: String?
        let instagramId: String?
        let twitterId: String?
    }
    
    let popularity: Float
    let posterPath: String?
    let id: Int
    let voteAverage: Float
    let title: String
    let backdropPath: String?
    let overview: String
    let releaseDate: String
    let videos:MovieVideos?
    let externalIds:ExternalIds?
}

struct MovieVideos : Codable {
    let results:[MovieVideo]
}

struct MovieVideo : Codable {
    let id:String
    let key:String
    let site:String
}
