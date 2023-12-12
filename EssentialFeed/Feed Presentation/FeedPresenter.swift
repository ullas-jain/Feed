//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 14/10/23.
//

import Foundation

public final class FeedPresenter {
    public static var title: String {
        NSLocalizedString("FEED_VIEW_TITLE",
                          tableName: "Feed",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Title for the feed view")
    }
}
