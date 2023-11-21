//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by ULLAS JAIN on 14/10/23.
//

public struct ResourceErrorViewModel {
    public let message: String?

    static var noError: ResourceErrorViewModel {
        ResourceErrorViewModel(message: nil)
    }

    static func error(message: String) -> ResourceErrorViewModel {
        ResourceErrorViewModel(message: message)
    }
}
