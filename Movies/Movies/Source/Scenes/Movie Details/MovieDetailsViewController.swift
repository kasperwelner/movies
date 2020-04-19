//
//  DetailViewController.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import WebKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bgImageView: UIImageView!
//    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var movieId:Int!
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
        fetchData()
    }
    
    func fetchData() {
        APIService.getMovie(withId: movieId){ [weak self] (response) in
            switch response.result {
            case .success(let movie):
                self?.movie = movie
                self?.populate()
            case .failure(let error):
                //TODO: Show error
                print(error)
            }
        }
    }
    
    func populate() {
        guard let movie = movie else {
            stackView.isHidden = true
            return
        }
        
        stackView.isHidden = false
        
//        if let backdropPath = movie.backdropPath, let backdropURL = ImageService.backdropURL(withPath: backdropPath, size: .w780) {
//            imageView.af.setImage(withURL: backdropURL)
//        }
        
        if let posterPath = movie.posterPath, let url = ImageService.posterURL(withPath: posterPath, size: .w780) {
            bgImageView.af.setImage(withURL: url)
        }
        
        titleLabel.text = movie.title
        descriptionLabel.text = movie.overview
        
        let firstYouTubeVideo = movie.videos?.results.last(where: { $0.site == "YouTube" })
        
        if let youTubeId = firstYouTubeVideo?.key {
            let urlString = "https://www.youtube.com/embed/\(youTubeId)?playsinline=1?autoplay=1"
            let youtubeRequest = URLRequest(url: URL(string: urlString)!)
            webView.load(youtubeRequest)
        }
    }
    
    @IBAction func twitterButtonPressed(_ sender: Any) {
        if let twitterId = movie?.externalIds?.twitterId, let url = URL(string: "https://www.twitter.com/"+twitterId) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func imdbButtonPressed(_ sender: Any) {
        if let imdbId = movie?.externalIds?.imdbId, let url = URL(string: "https://www.imdb.com/title/"+imdbId) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func instagramButtonPressed(_ sender: Any) {
        if let instaId = movie?.externalIds?.instagramId, let url = URL(string: "https://www.instagram.com/"+instaId) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
