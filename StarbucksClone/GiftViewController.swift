//
//  GiftViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit

class GiftViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
        title = "Gift"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}
