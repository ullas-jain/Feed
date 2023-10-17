//
//  CoreDataFeedStore+FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 17/10/23.
//

import Foundation

extension CoreDataFeedStore: FeedImageDataStore {
    public func insert(_: Data, for _: URL, completion _: @escaping (FeedImageDataStore.InsertionResult) -> Void) {}

    public func retrieve(dataForURL _: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        completion(.success(.none))
    }
}
