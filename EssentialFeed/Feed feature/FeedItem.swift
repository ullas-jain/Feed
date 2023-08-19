//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Jain Ullas on 8/19/23.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
