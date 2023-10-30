//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 07/10/23.
//

import EssentialFeed
import EssentialFeediOS

public final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: FeedLoader
    var presenter: FeedPresenter?

    public init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    public func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()

        feedLoader.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.presenter?.didFinishLoadingFeed(with: feed)

            case let .failure(error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        }
    }
}
