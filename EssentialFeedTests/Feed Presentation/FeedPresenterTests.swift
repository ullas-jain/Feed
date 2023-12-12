//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 09/10/23.
//

import EssentialFeed
import Foundation
import XCTest

class FeedPresenterTests: XCTestCase {
    func test_title_isLocalized() {
        XCTAssertEqual(FeedPresenter.title, localized("FEED_VIEW_TITLE"))
    }

    // MARK: - Helpers

    private func localized(_ key: String, file _: StaticString = #file, line _: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: #file, line: #line)
        }
        return value
    }
}
