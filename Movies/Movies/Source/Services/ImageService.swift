//
//  ImageService.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import Foundation

struct ImageService {
    private static let baseUrl = "http://image.tmdb.org/t/p/"
    
    public enum BackdropSize : String {
        case w300
        case w780
        case w1280
    }
    
    public enum PosterSize : String {
        case w342
        case w500
        case w780
    }
    
    public static func backdropURL(withPath path:String, size:BackdropSize) -> URL? {
        return URL(string:baseUrl + size.rawValue + "/" + path)
    }
    
    public static func posterURL(withPath path:String, size:PosterSize) -> URL? {
        return URL(string:baseUrl + size.rawValue + "/" + path)
    }
    
}
