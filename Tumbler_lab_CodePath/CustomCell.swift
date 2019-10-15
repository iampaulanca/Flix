//
//  CustomCell.swift
//  Tumbler_lab_CodePath
//
//  Created by Paul Ancajima on 10/14/19.
//  Copyright © 2019 Paul Ancajima. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var movieImageView  = UIImageView()
    var movieTitleLabel = UILabel()
    var movieDetail     = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(movieImageView)
        addSubview(movieTitleLabel)
        addSubview(movieDetail)
        
        setupImageView()
        setupTitleLable()
        setupMovieDetail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 5
        movieImageView.translatesAutoresizingMaskIntoConstraints                                                = false
        movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                = true
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive                                = true
        movieImageView.heightAnchor.constraint(equalToConstant: 80).isActive                                   = true
        movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor).isActive  = true
    }
    
    func setupTitleLable() {
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        movieTitleLabel.adjustsFontSizeToFitWidth                                                               = true
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints                                               = false
        movieTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive                          = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 15).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive              = true
    }
    
    func setupMovieDetail() {
        movieDetail.numberOfLines = 3
        movieDetail.font = movieDetail.font.withSize(12)
        movieDetail.translatesAutoresizingMaskIntoConstraints                                                   = false
        movieDetail.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 15).isActive          = true
        movieDetail.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 15).isActive     = true
        movieDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive                  = true
    }
    
}
