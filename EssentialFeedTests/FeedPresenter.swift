//
//  FeedPresenter.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 09/10/23.
//

import EssentialFeed
import Foundation
import XCTest

struct FeedViewModel {
    let feed: [FeedImage]
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

struct FeedErrorViewModel {
    let message: String?

    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }

    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }
}

protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}

struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

final class FeedPresenter {
    private let feedView: FeedView
    private let errorView: FeedErrorView
    private let loadingView: FeedLoadingView

    private var feedLoadError: String {
        String(localized: "FEED_VIEW_CONNECTION_ERROR")
    }

    init(feedView: FeedView, loadingView: FeedLoadingView, errorView: FeedErrorView) {
        self.feedView = feedView
        self.loadingView = loadingView
        self.errorView = errorView
    }

    func didStartLoadingFeed() {
        errorView.display(.noError)
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }

    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }

    func didFinishLoadingFeed(with _: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}

class FeedPresenterTests: XCTestCase {
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()

        XCTAssertTrue(view.messages.isEmpty)
    }

    func test_didStartLoadingFeed_displaysNoErrorMessageAndStartsLoading() {
        let (sut, view) = makeSUT()

        sut.didStartLoadingFeed()

        XCTAssertEqual(view.messages, [.display(errorMessage: .none), .display(isLoading: true)])
    }

    func test_didFinishLoadingFeed_displaysFeedAndStopsLoading() {
        let (sut, view) = makeSUT()
        let feed = uniqueImageFeed().models

        sut.didFinishLoadingFeed(with: feed)

        XCTAssertEqual(view.messages, [.display(feed: feed), .display(isLoading: false)])
    }

    func test_didFinishLoadingFeedWithError_displaysLocalizedErrorMessageAndStopsLoading() {
        let (sut, view) = makeSUT()

        sut.didFinishLoadingFeed(with: anyNSError())

        XCTAssertEqual(view.messages, [
            .display(errorMessage: localized("FEED_VIEW_CONNECTION_ERROR")),
            .display(isLoading: false),
        ])
    }

    // MARK: - Helpers

    private func localized(_ key: String, file _: StaticString = #file, line _: UInt = #line) -> String {
        let table = "Feed"
        let value = String(localized: LocalizedStringResource("\(key)"))
//            if value == key {
//                XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
//            }
        return value
    }

    private func makeSUT() -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(feedView: view, loadingView: view, errorView: view)
        trackForMemoryLeaks(view)
        trackForMemoryLeaks(sut)
        return (sut, view)
    }

    private class ViewSpy: FeedView, FeedErrorView, FeedLoadingView {
        enum Message: Hashable {
            case display(errorMessage: String?)
            case display(isLoading: Bool)
            case display(feed: [FeedImage])
        }

        private(set) var messages = Set<Message>()

        func display(_ viewModel: FeedErrorViewModel) {
            messages.insert(.display(errorMessage: viewModel.message))
        }

        func display(_ viewModel: FeedLoadingViewModel) {
            messages.insert(.display(isLoading: viewModel.isLoading))
        }

        func display(_ viewModel: FeedViewModel) {
            messages.insert(.display(feed: viewModel.feed))
        }
    }
}
