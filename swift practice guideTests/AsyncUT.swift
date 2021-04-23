//
//  AsyncUT.swift
//  swift practice guideTests
//
//  Created by riku on 2021/04/24.
//

import XCTest
@testable import swift_practice_guide

class AsyncUT: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_async() {
        let asyncEx = expectation(description: "async")
        var opValue: Int?
        Async().getAsync { value in
            opValue = value
            asyncEx.fulfill()
        }
        
        wait(for: [asyncEx], timeout: 3)
        XCTAssertEqual(opValue, 4)
    }

}
