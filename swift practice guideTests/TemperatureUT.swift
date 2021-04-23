//
//  Temperature.swift
//  swift practice guideTests
//
//  Created by riku on 2021/04/24.
//

import XCTest
import swift_practice_guide

class TemperatureUT: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_1() {
        let temperature = Temperature(celsius: 0)
        XCTAssertEqual(temperature.celsius, 0)
        XCTAssertEqual(temperature.fahrenheit, 32)
    }

}
