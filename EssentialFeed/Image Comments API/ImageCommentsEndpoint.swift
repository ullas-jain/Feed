//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 11/12/23.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
