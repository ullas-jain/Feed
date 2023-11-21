//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 14/10/23.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    public var hasLocation: Bool {
        location != nil
    }
}
