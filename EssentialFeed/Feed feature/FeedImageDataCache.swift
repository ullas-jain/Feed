//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 27/10/23.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
