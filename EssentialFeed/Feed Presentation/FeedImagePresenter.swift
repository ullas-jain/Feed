//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 14/10/23.
//

import Foundation

public enum FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location
        )
    }
}
