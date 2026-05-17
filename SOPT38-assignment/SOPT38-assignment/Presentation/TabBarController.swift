//
//  TabBarController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import SnapKit

class TabBarController: UITabBarController {

    private let customTabBar = CustomTabBar()

    lazy var mainNVC = makeNav(rootViewController: MainViewController())
    lazy var purchaseNVC = makeNav(rootViewController: PurchaseViewController())
    lazy var webtoonNVC = makeNav(rootViewController: WebtoonViewController())
    lazy var searchNVC = makeNav(rootViewController: SearchViewController())
    lazy var libraryNVC = makeNav(rootViewController: LibraryViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainNVC, purchaseNVC, webtoonNVC, searchNVC, libraryNVC], animated: false)
        tabBar.isHidden = true
        setupCustomTabBar()
    }

    private func setupCustomTabBar() {
        view.addSubview(customTabBar)
        customTabBar.delegate = self
        customTabBar.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }

    private func makeNav(rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.isHidden = true
        nav.view.backgroundColor = .black
        return nav
    }
}

extension TabBarController: CustomTabBarDelegate {
    func customTabBar(_ tabBar: CustomTabBar, didSelectAt index: Int) {
        selectedIndex = index
    }
}
