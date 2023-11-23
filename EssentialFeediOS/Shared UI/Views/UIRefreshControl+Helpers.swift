//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 09/10/23.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
