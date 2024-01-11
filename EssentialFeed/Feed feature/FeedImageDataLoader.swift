//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 25/09/23.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
