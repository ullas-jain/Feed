//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 21/11/23.
//

import EssentialFeed
import XCTest

class ImageCommentsLocalizationTests: XCTestCase {
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
