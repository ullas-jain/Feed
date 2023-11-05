//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by ULLAS JAIN on 05/11/23.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
