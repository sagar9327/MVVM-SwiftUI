//
//  RedditListViewModelTest.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

import XCTest
@testable import MVVM_SwiftUI

@MainActor
final class RedditListViewModelTests: XCTestCase {

    
    enum RedditListClientError: Error {
        case networkError
    }
    
    
    func test_initialState() {
        let spy = RedditListClientSpy()
        let vm = RedditListViewModel(
            client: spy
        )
        XCTAssertTrue(vm.arrPost.isEmpty)
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.errorMessage)
    }
    
    func test_fetchRedditList_success() async {
        let spy = RedditListClientSpy()
        spy.posts = [RedditPost(userId: 1, id: 1, title: "Swift", body: "Swift Language"),RedditPost(userId: 2, id: 2, title: "SwiftUI", body: "SwiftUI")
        ]
        let vm = RedditListViewModel(
            client: spy
        )
        await vm.fetchRedditList()
        XCTAssertEqual(vm.arrPost.count, 2)
        XCTAssertEqual(vm.arrPost[0].title, "Swift")
        XCTAssertEqual(vm.arrPost[1].title, "SwiftUI")
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.errorMessage)
    }
    
    func test_fetchRedditList_failure() async {
        let spy = RedditListClientSpy()
        spy.error = RedditListClientError.networkError
        let vm = RedditListViewModel(client: spy)
        await vm.fetchRedditList()
        XCTAssertTrue(vm.arrPost.isEmpty)
        XCTAssertFalse(vm.isLoading)
        XCTAssertNotNil(vm.errorMessage)
    }
}
