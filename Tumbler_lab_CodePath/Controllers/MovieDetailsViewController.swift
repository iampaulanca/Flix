//
//  MovieDetailsViewController.swift
//  Tumbler_lab_CodePath
//
//  Created by Paul Ancajima on 10/19/19.
//  Copyright © 2019 Paul Ancajima. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private enum Metrics {
      static let padding: CGFloat = 15.0
      static let iconImageViewWidth: CGFloat = 30.0
    }
    
    var safeArea: UILayoutGuide!
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2.0
        return imageView
    }()
    
    let backdropView: UIImageView = {
        let backdropView = UIImageView()
        backdropView.translatesAutoresizingMaskIntoConstraints = false
        return backdropView
    }()
    
    let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        
        return label
    }()
    
    let releaseDateView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        return label
    }()
   
    let overviewView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = .black
        setupView()
    }
    
    
    
    func setupView(){
        
        view.addSubview(movieImageView)
        view.addSubview(backdropView)
        view.addSubview(titleView)
        view.addSubview(overviewView)
        view.addSubview(releaseDateView)
        view.addSubview(overviewView)
        
        movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 187).isActive = true
        
        backdropView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backdropView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backdropView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backdropView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        titleView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
        titleView.topAnchor.constraint(equalTo: backdropView.bottomAnchor, constant: 15).isActive = true
        titleView.trailingAnchor.constraint(equalTo: backdropView.trailingAnchor).isActive = true
        
        releaseDateView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
        releaseDateView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        releaseDateView.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor).isActive = true
        
        overviewView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 15).isActive = true
        overviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        overviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        overviewView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        self.view.bringSubviewToFront(movieImageView)
    }
    
}
