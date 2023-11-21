//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by ULLAS JAIN on 06/10/23.
//

import EssentialFeed
import XCTest

final class FeedLocalizationTests: XCTestCase {
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
