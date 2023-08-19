//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jain Ullas on 8/19/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
