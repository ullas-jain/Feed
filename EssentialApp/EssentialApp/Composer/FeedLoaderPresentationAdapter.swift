//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 07/10/23.
//
import Combine
import EssentialFeed
import EssentialFeediOS

public final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: () -> FeedLoader.Publisher
    private var cancellable: Cancellable?
    var presenter: FeedPresenter?

    public init(feedLoader: @escaping () -> FeedLoader.Publisher) {
        self.feedLoader = feedLoader
    }

    public func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()

        cancellable = feedLoader().sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished: break

                case let .failure(error):
                    self?.presenter?.didFinishLoadingFeed(with: error)
                }
            }, receiveValue: { [weak self] feed in
                self?.presenter?.didFinishLoadingFeed(with: feed)
            }
        )
    }
}
