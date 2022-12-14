//
//  UIHelper.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 12.12.2022.
//

import UIKit

enum UIHelper {
    static func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width
        let itemWidth = width / 2.16
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
    
    static func createCastFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: 160, height: 290)
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
    
    static func createExploreFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width
        let itemWidth = width / 2.16
        
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        flowLayout.scrollDirection = .vertical
        
        return flowLayout
    }

    static func createWatchlistFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width
        let itemWidth = width / 3.31
        
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        flowLayout.scrollDirection = .vertical
        
        return flowLayout
    }
}
