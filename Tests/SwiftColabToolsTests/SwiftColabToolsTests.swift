import XCTest
@testable import SwiftColabTools

final class SwiftColabToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftColabTools().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}