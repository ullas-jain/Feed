//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 06/10/23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
