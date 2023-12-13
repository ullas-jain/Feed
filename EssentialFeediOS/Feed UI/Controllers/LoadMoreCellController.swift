//
//  LoadMoreCellController.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 12/12/23.
//

import EssentialFeed
import UIKit

public class LoadMoreCellController: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let cell = LoadMoreCell()
    private let callback: () -> Void

    public init(callback: @escaping () -> Void) {
        self.callback = callback
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    public func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        cell.selectionStyle = .none
        return cell
    }

    public func tableView(_: UITableView, willDisplay _: UITableViewCell, forRowAt _: IndexPath) {
        reloadIfNeeded()
    }

    public func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        reloadIfNeeded()
    }

    private func reloadIfNeeded() {
        guard !cell.isLoading else { return }

        callback()
    }
}

extension LoadMoreCellController: ResourceLoadingView, ResourceErrorView {
    public func display(_ viewModel: ResourceErrorViewModel) {
        cell.message = viewModel.message
    }

    public func display(_ viewModel: ResourceLoadingViewModel) {
        cell.isLoading = viewModel.isLoading
    }
}
