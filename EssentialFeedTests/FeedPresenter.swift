//
//  FeedPresenter.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 09/10/23.
//

import Foundation
import XCTest

final class FeedPresenter {
    init(view _: Any) {}
}

class FeedPresenterTests: XCTestCase {
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        _ = FeedPresenter(view: view)

        XCTAssertTrue(view.messages.isEmpty)
    }

    // MARK: - Helpers

    private class ViewSpy {
        let messages = [Any]()
    }
}
