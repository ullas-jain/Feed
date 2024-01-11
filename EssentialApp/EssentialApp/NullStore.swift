//
//  NullStore.swift
//  EssentialApp
//
//  Created by ULLAS JAIN on 03/01/24.
//

import EssentialFeed
import Foundation

class NullStore: FeedStore & FeedImageDataStore {
    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        completion(.success(()))
    }

    func insert(_: [LocalFeedImage], timestamp _: Date, completion: @escaping InsertionCompletion) {
        completion(.success(()))
    }

    func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.success(.none))
    }

    func insert(_: Data, for _: URL) throws {}

    func retrieve(dataForURL _: URL) throws -> Data? { .none }
}
