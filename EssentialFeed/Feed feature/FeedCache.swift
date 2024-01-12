//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 27/10/23.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
