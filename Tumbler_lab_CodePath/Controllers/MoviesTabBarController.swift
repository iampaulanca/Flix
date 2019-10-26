//
//  MoviesTabBarController.swift
//  Tumbler_lab_CodePath
//
//  Created by Paul Ancajima on 10/21/19.
//  Copyright © 2019 Paul Ancajima. All rights reserved.
//

import UIKit

class MoviesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let vc = UINavigationController(rootViewController: ViewController())
        vc.tabBarItem.title = "Home"
        let layout = UICollectionViewFlowLayout()
        let moviePostersVC = UINavigationController(rootViewController: PostersCollectionViewController(collectionViewLayout: layout))
        moviePostersVC.tabBarItem.title = "Posters"
        viewControllers = [vc, moviePostersVC]
    }

}
