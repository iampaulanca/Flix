//
//  ViewController.swift
//  Tumbler_lab_CodePath
//
//  Created by Paul Ancajima on 10/12/19.
//  Copyright © 2019 Paul Ancajima. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var movies = [[String:Any]]()
    struct Cells {
        static let customCell = "CustomCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        safeArea = view.layoutMarginsGuide
        setupTableView()
        retrieveMovies()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.pin(to: view)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: Cells.customCell)
    }
    
    
    private func retrieveMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies = dataDictionary["results"] as! [[String:Any]]
                self.tableView.reloadData()
               
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.customCell) as! CustomCell
        let movie = movies[indexPath.row]
        cell.movieTitleLabel.text = (movie["title"] as! String)
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        cell.movieImageView.af_setImage(withURL: posterUrl!)
        
        cell.movieDetail.text = (movie["overview"] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // current movie
        let movie = movies[indexPath.row]
        
        //base url
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        
        // get poster
        let posterPath = movie["poster_path"] as! String
        guard let posterUrl = URL(string: baseUrl + posterPath) else { return }
        
        // get backdrop
        let backDropPath = movie["backdrop_path"] as! String
        guard let backDropUrl = URL(string: baseUrl + backDropPath) else { return }
        
        // get title
        let title = movie["original_title"] as! String
        
        // get release date
        let releaseDate = movie["release_date"] as! String
        
        // get overview
        let overview = movie["overview"] as! String
        
        
        let vc = MovieDetailsViewController()
        vc.movieImageView.af_setImage(withURL: posterUrl)
        vc.backdropView.af_setImage(withURL: backDropUrl)
        vc.titleView.text = title
        vc.releaseDateView.text = releaseDate
        vc.overviewView.text = overview
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
