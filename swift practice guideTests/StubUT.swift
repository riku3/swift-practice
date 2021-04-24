//
//  StubUT.swift
//  swift practice guideTests
//
//  Created by riku on 2021/04/24.
//

import XCTest
@testable import swift_practice_guide

class StubUT: XCTestCase {
    let url = URL(string: "https://example.com")!
    let data = Data()
    
    func makeStubHTTPClient(statusCode: Int) -> StubHTTPClient {
        let urlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        
        return StubHTTPClient(result: .success((data, urlResponse)))
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test200() {
        let httpClient =  makeStubHTTPClient(statusCode: 200)
        let statusFetcher = StatusFetcher(httpClient: httpClient)
        let responseEx = expectation(description: "wating for response")
        
        statusFetcher.fetchStatus(of: url) { result in
            switch result {
            case .success(let statusCode):
                XCTAssertEqual(statusCode, 200)
            case .failure:
                XCTFail()
            }
            responseEx.fulfill()
        }
        waitForExpectations(timeout: 10)
    }

}

final class StubHTTPClient: HTTPClient {
    let result: Result<(Data, HTTPURLResponse), Error>
    
    init(result: Result<(Data, HTTPURLResponse), Error>) {
        self.result = result
    }
    
    func fetchContents(of url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [result] in
            completion(result)
        }
    }
}
