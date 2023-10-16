//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 16/10/23.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    typealias InsertionResult = Swift.Result<Void, Error>

    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void)

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
