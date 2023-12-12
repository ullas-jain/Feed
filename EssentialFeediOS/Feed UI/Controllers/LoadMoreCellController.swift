//
//  LoadMoreCellController.swift
//  EssentialFeediOS
//
//  Created by ULLAS JAIN on 12/12/23.
//

import EssentialFeed
import UIKit

public class LoadMoreCellController: NSObject, UITableViewDataSource {
    private let cell = LoadMoreCell()

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    public func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        cell
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
