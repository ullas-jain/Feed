//
//  NullStore.swift
//  EssentialApp
//
//  Created by ULLAS JAIN on 03/01/24.
//

import EssentialFeed
import Foundation

class NullStore: FeedStore & FeedImageDataStore {
    func deleteCachedFeed() throws {}

    func insert(_: [LocalFeedImage], timestamp _: Date) throws {}

    func retrieve() throws -> CachedFeed? { .none }

    func insert(_: Data, for _: URL) throws {}

    func retrieve(dataForURL _: URL) throws -> Data? { .none }
}
