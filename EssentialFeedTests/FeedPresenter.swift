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
        let (_, view) = makeSUT()

        XCTAssertTrue(view.messages.isEmpty)
    }

    // MARK: - Helpers

    private func makeSUT() -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeaks(view)
        trackForMemoryLeaks(sut)
        return (sut, view)
    }

    private class ViewSpy {
        let messages = [Any]()
    }
}
