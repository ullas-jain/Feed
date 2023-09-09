//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jain Ullas on 8/19/23.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>

    func load(completion: @escaping (Result) -> Void)
}
