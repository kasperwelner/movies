//
//  MasterViewController.swift
//  Movies
//
//  Created by Kasper Welner on 19/04/2020.
//  Copyright © 2020 Kasper Welner. All rights reserved.
//

import UIKit

class MoviesViewController: UITableViewController {

    var movies = [MovieListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Popular"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        APIService.getPopularMovies { [weak self] (response) in
            switch response.result {
            case .success(let page):
                self?.movies = page.results
                self?.tableView.reloadData()
            case .failure(let error):
                //TODO: Show error
                print(error)
            }
        }
    }
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieCell
        let item = movies[indexPath.row]
        cell.set(movieItem: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = movies[indexPath.row]
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MovieDetails") as? MovieDetailsViewController else { fatalError("This shouldn't happen") }
        vc.movieId = item.id
        vc.navigationItem.title = item.title
        navigationController?.pushViewController(vc, animated: true)
    }
}

