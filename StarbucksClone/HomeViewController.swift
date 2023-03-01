//
//  HomeViewController.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit

private enum Constants {
    static let buttonHeight: CGFloat = 60
    static let buttonWidth: CGFloat = 170
}

class HomeViewController: StarbucksViewController {
    let headerView = HomeHeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let scanButton = UIButton()
    
    let tiles = [
        RewardsTileViewController(),
        TileViewController(title: "Breakfast made meatless",
                           subtitle: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.",
                           imageName: "meatless"),
        
        TileViewController(title: "Uplifting our communities",
                           subtitle: "Thanks to our partners' nominations, The Starbucks Foundation is donating $145K to more than 50 local charities.",
                           imageName: "communities"),
        
        TileViewController(title: "Spend at least $15 for 50 Bonus Stars",
                           subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.",
                           imageName: "bonus"),
    ]
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = "Home"
        
        setTabBarImage(imageName: "house.fill", title: "Home")
        setupScrollView()
        style()
        layout()
    }
    
    func setupScrollView() {
        scrollView.delegate = self
    }
    
}

extension HomeViewController {
    func style() {
        view.backgroundColor = .backgroundWhite
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = Constants.buttonHeight / 2
        
    }
    
    func layout() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        view.addSubview(scanButton)
        scrollView.addSubview(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }

        
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)

        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            scanButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let isScrollingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.greeting.frame.height + 16 // label + spacer (102)
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greeting.alpha = isScrollingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0) {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        }
    }
}
