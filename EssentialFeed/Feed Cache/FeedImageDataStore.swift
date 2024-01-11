//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 16/10/23.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
