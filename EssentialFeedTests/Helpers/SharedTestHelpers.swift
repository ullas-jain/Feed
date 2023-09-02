//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Jain Ullas on 9/1/23.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}