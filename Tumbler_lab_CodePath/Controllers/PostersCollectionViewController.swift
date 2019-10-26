//
//  PostersCollectionViewController.swift
//  Tumbler_lab_CodePath
//
//  Created by Paul Ancajima on 10/21/19.
//  Copyright © 2019 Paul Ancajima. All rights reserved.
//

import UIKit
import AlamofireImage

class PostersCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var movies = [[String:Any]]()
    struct Cells {
        static let posterCell = "PosterCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveMovies()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        title = "Movie Posters"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PosterCell.self, forCellWithReuseIdentifier: Cells.posterCell)
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
                self.collectionView.reloadData()
            }
        }
        task.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // set cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.posterCell, for: indexPath) as! PosterCell
        
        // get movie
        let movie = movies[indexPath.row]
        
        // get movie poster
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        // set movie poster
        cell.posterImage.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
        
        
        // set MovieDetailsVC
        let vc = MovieDetailsViewController()
        vc.movieImageView.af_setImage(withURL: posterUrl)
        vc.backdropView.af_setImage(withURL: backDropUrl)
        vc.titleView.text = title
        vc.releaseDateView.text = releaseDate
        vc.overviewView.text = overview
        
        // push VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // set size of collectionview cells
        return CGSize(width: (view.frame.width-5)/3, height: (view.frame.width-5)/3)
    }
    
    // space between columns
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    // space between rows
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    
}
