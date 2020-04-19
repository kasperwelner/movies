//
//  MovieListResultPage.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import Foundation

struct MoviesListResultPage : Codable {
    let results:[MovieListItem]
    let page:Int
}
