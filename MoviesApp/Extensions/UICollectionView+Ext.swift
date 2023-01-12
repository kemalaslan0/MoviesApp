//
//  UICollectionView+Ext.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 12.12.2022.
//

import UIKit

extension UICollectionView {
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
