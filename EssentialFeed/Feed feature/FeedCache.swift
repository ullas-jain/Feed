//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 27/10/23.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
