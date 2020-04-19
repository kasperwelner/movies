//
//  MovieCell.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel:UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(movieItem item:MovieListItem) {
        movieTitleLabel.text = item.title
        if let backdropPath = item.backdropPath, let backdropURL = ImageService.backdropURL(withPath: backdropPath, size: .w780) {
            movieImageView?.af.setImage(withURL: backdropURL)
            
        }
        setNeedsLayout()
    }

}
