//
//  PosterCell.swift
//  Tumbler_lab_CodePath
//
//  Created by Paul Ancajima on 10/25/19.
//  Copyright © 2019 Paul Ancajima. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    var posterImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        setupImageView()
    }
    
    func setupImageView() {
        posterImage.layer.cornerRadius = 5
        posterImage.layer.borderWidth = 1
        posterImage.layer.borderColor = UIColor.white.cgColor
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds                                                       = true
        posterImage.translatesAutoresizingMaskIntoConstraints                           = false
        
        posterImage.topAnchor.constraint(equalTo: topAnchor).isActive                   = true
        posterImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive             = true
        posterImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive           = true
        posterImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive         = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
}
