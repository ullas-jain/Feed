//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 14/10/23.
//

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
