//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 26/09/23.
//

import EssentialFeed
import Foundation

final class FeedViewModel {
    private let feedLoader: FeedLoader

    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    var onChange: ((FeedViewModel) -> Void)?
    var onFeedLoad: (([FeedImage]) -> Void)?

    private(set) var isLoading: Bool = false {
        didSet { onChange?(self) }
    }

    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
        }
    }
}
