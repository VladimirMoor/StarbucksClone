//
//  StoreViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit

class StoreViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemTeal
        title = "Stores"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Stores")
    }
}
