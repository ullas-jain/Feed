//
//  FeedEndpointTests.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 11/12/23.
//

import EssentialFeed
import XCTest

class FeedEndpointTests: XCTestCase {
    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!

        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")!

        XCTAssertEqual(received, expected)
    }
}
