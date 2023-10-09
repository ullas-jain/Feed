//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 09/10/23.
//

struct FeedErrorViewModel {
    let message: String?

    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
