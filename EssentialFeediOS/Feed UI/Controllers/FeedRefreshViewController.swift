//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 25/09/23.
//

import EssentialFeed
import UIKit

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    private(set) lazy var view = loadView()

    private let loadFeed: () -> Void

    init(loadFeed: @escaping () -> Void) {
        self.loadFeed = loadFeed
    }

    var onRefresh: (([FeedImage]) -> Void)?

    @objc func refresh() {
        loadFeed()
    }

    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view.beginRefreshing()
        } else {
            view.endRefreshing()
        }
    }

    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
