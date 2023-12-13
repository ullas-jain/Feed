//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 11/12/23.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/v1/feed"
            components.queryItems = [
                URLQueryItem(name: "limit", value: "10"),
            ]
            return components.url!
        }
    }
}
