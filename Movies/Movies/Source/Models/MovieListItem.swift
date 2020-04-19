//
//  MovieListItem.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import Foundation

struct MovieListItem : Codable {
    let popularity: Float
    let posterPath: String?
    let id: Int
    let voteAverage: Float
    let title: String
    let backdropPath: String?
    let overview: String
    let releaseDate: String
}
