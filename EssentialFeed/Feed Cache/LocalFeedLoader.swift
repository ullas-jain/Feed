//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Jain Ullas on 8/30/23.
//

import Foundation

public final class LocalFeedLoader: FeedLoader {
    private let store: FeedStore
    private let currentDate: () -> Date

    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
}

public extension LocalFeedLoader {
    typealias SaveResult = Error?

    func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedFeed { [weak self] error in
            guard let self else { return }

            if let cacheDeletionError = error {
                completion(cacheDeletionError)
            } else {
                cache(feed, with: completion)
            }
        }
    }

    private func cache(_ feed: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(feed.toLocal(), timestamp: currentDate()) { [weak self] error in
            guard self != nil else { return }

            completion(error)
        }
    }
}

public extension LocalFeedLoader {
    typealias LoadResult = LoadFeedResult

    func load(completion: @escaping (LoadResult) -> Void) {
        store.retrieve { [weak self] result in
            guard let self else { return }

            switch result {
            case let .failure(error):
                completion(.failure(error))

            case let .found(feed, timestamp) where FeedCachePolicy.validate(timestamp, against: currentDate()):
                completion(.success(feed.toModels()))

            case .found, .empty:
                completion(.success([]))
            }
        }
    }
}

public extension LocalFeedLoader {
    func validateCache() {
        store.retrieve { [weak self] result in
            guard let self else { return }

            switch result {
            case .failure:
                store.deleteCachedFeed { _ in }

            case let .found(_, timestamp) where !FeedCachePolicy.validate(timestamp, against: currentDate()):
                store.deleteCachedFeed { _ in }

            case .empty, .found: break
            }
        }
    }
}

private extension [FeedImage] {
    func toLocal() -> [LocalFeedImage] {
        map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}

private extension [LocalFeedImage] {
    func toModels() -> [FeedImage] {
        map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}
