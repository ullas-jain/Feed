//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by ULLAS JAIN on 25/09/23.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
