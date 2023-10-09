//
//  FeedErrorView.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 09/10/23.
//

import UIKit

public final class ErrorView: UIView {
    @IBOutlet private var label: UILabel!

    public var message: String? {
        get { label.text }
        set { label.text = newValue }
    }

    override public func awakeFromNib() {
        super.awakeFromNib()

        label.text = nil
    }
}
