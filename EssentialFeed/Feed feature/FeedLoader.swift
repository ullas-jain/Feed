//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jain Ullas on 8/19/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
