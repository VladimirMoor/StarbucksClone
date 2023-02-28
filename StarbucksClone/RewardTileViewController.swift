//
//  RewardsTileViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 26.02.2023.
//

import UIKit

class RewardTileViewController: UIViewController {
    
    let rewardTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rewardTileView)
        rewardTileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rewardTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
