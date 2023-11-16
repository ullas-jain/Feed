//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Jain Ullas on 9/1/23.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    Data("any data".utf8)
}

func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    let json = ["items": items]
    // swiftlint:disable force_try
    return try! JSONSerialization.data(withJSONObject: json)
    // swiftlint:enable force_try
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
