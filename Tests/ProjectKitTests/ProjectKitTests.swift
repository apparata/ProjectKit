import XCTest
@testable import ProjectKit

final class ProjectKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ProjectKit().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
