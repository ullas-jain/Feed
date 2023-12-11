//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by ULLAS JAIN on 06/10/23.
//

import EssentialFeed
import Foundation
import XCTest

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_: Any) {}
    }

    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }

    var feedTitle: String {
        FeedPresenter.title
    }

    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
