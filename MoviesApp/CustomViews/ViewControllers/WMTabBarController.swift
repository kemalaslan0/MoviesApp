//
//  WMTabBarController.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 12.12.2022.
//

import UIKit

class WMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
        configureNavigationBar()
        viewControllers = [createMoviesNC(), createShowsNC(), createSearchNC(), createWatchlistNC()]
    }
    
    private func createMoviesNC() -> UINavigationController {
        let moviesVC = MoviesVC()
        moviesVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), tag: 0)
        
        return UINavigationController(rootViewController: moviesVC)
    }
    
    private func createShowsNC() -> UINavigationController {
        let showsVC = ShowsVC()
        showsVC.tabBarItem = UITabBarItem(title: "Shows", image: UIImage(systemName: "tv"), tag: 1)
        
        return UINavigationController(rootViewController: showsVC)
    }
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createWatchlistNC() -> UINavigationController {
        let watchlistVC = WatchlistVC()
        watchlistVC.tabBarItem = UITabBarItem(title: "Watchlist", image: UIImage(systemName: "list.and.film"), tag: 3)
        
        return UINavigationController(rootViewController: watchlistVC)
    }
    
    private func configureTabBar() {
        UITabBar.appearance().tintColor = .systemRed
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        } else {
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemRed
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    }
}
