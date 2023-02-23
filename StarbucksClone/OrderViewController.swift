//
//  OrderViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit

class OrderViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
        title = "Order"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}
