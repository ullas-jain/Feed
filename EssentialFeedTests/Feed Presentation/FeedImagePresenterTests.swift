//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 14/10/23.
//

import EssentialFeed
import XCTest

class FeedImagePresenterTests: XCTestCase {
    func test_map_createsViewModel() {
        let image = uniqueImage()

        let viewModel = FeedImagePresenter.map(image)

        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
