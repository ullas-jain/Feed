//
//  LocalFeedImageDataLoaderTests.swift
//  EssentialFeedTests
//
//  Created by ULLAS JAIN on 16/10/23.
//

import EssentialFeed
import XCTest

class LoadFeedImageDataFromCacheUseCaseTests: XCTestCase {
    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()

        XCTAssertTrue(store.receivedMessages.isEmpty)
    }

    func test_saveImageDataForURL_requestsImageDataInsertionForURL() {
        let (sut, store) = makeSUT()
        let url = anyURL()
        let data = anyData()

        sut.save(data, for: url) { _ in }

        XCTAssertEqual(store.receivedMessages, [.insert(data: data, for: url)])
    }

    func test_loadImageDataFromURL_requestsStoredDataForURL() {
        let (sut, store) = makeSUT()
        let url = anyURL()

        _ = sut.loadImageData(from: url) { _ in }

        XCTAssertEqual(store.receivedMessages, [.retrieve(dataFor: url)])
    }

    func test_loadImageDataFromURL_failsOnStoreError() {
        let (sut, store) = makeSUT()

        expect(sut, toCompleteWith: failed(), when: {
            let retrievalError = anyNSError()
            store.completeRetrieval(with: retrievalError)
        })
    }

    func test_loadImageDataFromURL_deliversNotFoundErrorOnNotFound() {
        let (sut, store) = makeSUT()

        expect(sut, toCompleteWith: notFound(), when: {
            store.completeRetrieval(with: .none)
        })
    }

    func test_loadImageDataFromURL_deliversStoredDataOnFoundData() {
        let (sut, store) = makeSUT()
        let foundData = anyData()

        expect(sut, toCompleteWith: .success(foundData), when: {
            store.completeRetrieval(with: foundData)
        })
    }

    func test_loadImageDataFromURL_doesNotDeliverResultAfterCancellingTask() {
        let (sut, store) = makeSUT()
        let foundData = anyData()

        var received = [FeedImageDataLoader.Result]()
        let task = sut.loadImageData(from: anyURL()) { received.append($0) }
        task.cancel()

        store.completeRetrieval(with: foundData)
        store.completeRetrieval(with: .none)
        store.completeRetrieval(with: anyNSError())

        XCTAssertTrue(received.isEmpty, "Expected no received results after cancelling task")
    }

    func test_loadImageDataFromURL_doesNotDeliverResultAfterSUTInstanceHasBeenDeallocated() {
        let store = StoreSpy()
        var sut: LocalFeedImageDataLoader? = LocalFeedImageDataLoader(store: store)

        var received = [FeedImageDataLoader.Result]()
        _ = sut?.loadImageData(from: anyURL()) { received.append($0) }

        sut = nil
        store.completeRetrieval(with: anyData())

        XCTAssertTrue(received.isEmpty, "Expected no received results after instance has been deallocated")
    }

    // MARK: - Helpers

    private func makeSUT(currentDate _: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedImageDataLoader, store: StoreSpy) {
        let store = StoreSpy()
        let sut = LocalFeedImageDataLoader(store: store)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }

    private func failed() -> FeedImageDataLoader.Result {
        .failure(LocalFeedImageDataLoader.LoadError.failed)
    }

    private func notFound() -> FeedImageDataLoader.Result {
        .failure(LocalFeedImageDataLoader.LoadError.notFound)
    }

    private func never(file: StaticString = #file, line: UInt = #line) {
        XCTFail("Expected no no invocations", file: file, line: line)
    }

    private func expect(_ sut: LocalFeedImageDataLoader, toCompleteWith expectedResult: FeedImageDataLoader.Result, when action: () -> Void, file: StaticString = #file, line: UInt = #line) {
        let exp = expectation(description: "Wait for load completion")

        _ = sut.loadImageData(from: anyURL()) { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedData), .success(expectedData)):
                XCTAssertEqual(receivedData, expectedData, file: file, line: line)

            case let (.failure(receivedError as LocalFeedImageDataLoader.LoadError),
                      .failure(expectedError as LocalFeedImageDataLoader.LoadError)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)

            default:
                XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
            }

            exp.fulfill()
        }

        action()
        wait(for: [exp], timeout: 1.0)
    }

    private class StoreSpy: FeedImageDataStore {
        enum Message: Equatable {
            case insert(data: Data, for: URL)
            case retrieve(dataFor: URL)
        }

        private(set) var receivedMessages = [Message]()
        private var retrievalCompletions = [(FeedImageDataStore.RetrievalResult) -> Void]()

        func insert(_ data: Data, for url: URL, completion _: @escaping (FeedImageDataStore.InsertionResult) -> Void) {
            receivedMessages.append(.insert(data: data, for: url))
        }

        func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
            receivedMessages.append(.retrieve(dataFor: url))
            retrievalCompletions.append(completion)
        }

        func completeRetrieval(with error: Error, at index: Int = 0) {
            retrievalCompletions[index](.failure(error))
        }

        func completeRetrieval(with data: Data?, at index: Int = 0) {
            retrievalCompletions[index](.success(data))
        }
    }
}