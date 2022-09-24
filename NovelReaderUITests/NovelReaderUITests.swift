//
//  NovelReaderUITests.swift
//  NovelReaderUITests
//
//  Created by Praveen Prabhakar on 24/09/22.
//

import XCTest

final class NovelReaderUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
