//
//  ListSnapshotTests.swift .swift
//  EssentialFeediOSTests
//
//  Created by ULLAS JAIN on 23/11/23.
//

@testable import EssentialFeed
import EssentialFeediOS
import XCTest

class ListSnapshotTests: XCTestCase {
    func test_emptyList() {
        let sut = makeSUT()

        sut.display(emptyList())

        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "EMPTY_LIST_light")
        assert(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "EMPTY_LIST_dark")
    }

    func test_listWithErrorMessage() {
        let sut = makeSUT()

        sut.display(.error(message: "This is a\nmulti-line\nerror message"))

        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "LIST_WITH_ERROR_MESSAGE_light")
        assert(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "LIST_WITH_ERROR_MESSAGE_dark")
    }

    // MARK: - Helpers

    private func makeSUT() -> ListViewController {
        let controller = ListViewController()
        controller.loadViewIfNeeded()
        controller.tableView.separatorStyle = .none
        controller.tableView.showsVerticalScrollIndicator = false
        controller.tableView.showsHorizontalScrollIndicator = false
        return controller
    }

    private func emptyList() -> [CellController] {
        return []
    }
}
