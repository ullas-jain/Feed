//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 04/10/23.
//

import EssentialFeed
import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        location != nil
    }
}
