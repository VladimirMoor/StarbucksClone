//
//  HomeViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit

class HomeViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemYellow
        title = "Home"
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good day Username!"
    }
}
