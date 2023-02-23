//
//  ScanViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit

class ScanViewController: StarbucksViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemIndigo
        title = "Scan"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}
