//
//  APIService.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import Foundation
import Alamofire

struct APIService {
    static let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYTNiNzcyM2RkYjk3ZTk2MDFlZDg2ODc2NTZjZTA3MCIsInN1YiI6IjVlOWIyMDU2ZWI3OWMyMDAyMDViOGJmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3zzehIjPmyMMLv59HiqRH3QSH4ePEAnbjqs3euIgJgY"
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    
    static var authHeader: HTTPHeaders {
        return ["Authorization" : "Bearer "+apiKey]
    }
    
    static let decoder:JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func getPopularMovies(completion: @escaping (DataResponse<MoviesListResultPage, AFError>)->Void) {
        AF.request(baseURL + "popular",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: authHeader)
            .validate()
            .responseDecodable(decoder: decoder, completionHandler: completion)
    }
    
    static func getMovie(withId id: Int, completion: @escaping (DataResponse<Movie, AFError>)->Void) {
        AF.request(baseURL + "\(id)?append_to_response=images,videos,external_ids",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: authHeader)
            .validate()
            .responseDecodable(decoder: decoder, completionHandler: completion)
    }
}
