//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Jain Ullas on 9/17/23.
//

import XCTest

final class FeedViewController {
    init(loader _: FeedViewControllerTests.LoaderSpy) {}
}

final class FeedViewControllerTests: XCTestCase {
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)

        XCTAssertEqual(loader.loadCallCount, 0)
    }

    // MARK: - Helpers

    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }
}
