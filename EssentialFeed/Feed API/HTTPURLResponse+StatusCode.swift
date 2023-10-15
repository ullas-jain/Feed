//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 15/10/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { 200 }

    var isOK: Bool {
        statusCode == HTTPURLResponse.OK_200
    }
}
