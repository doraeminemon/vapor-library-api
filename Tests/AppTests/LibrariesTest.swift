import Vapor
import HTTP
import XCTest
import FluentPostgreSQL

@testable import App

class LibrariesTest: XCTestCase {
  var app: Application!
  var conn: PostgreSQLConnection!

  override func setUp() {
    super.setUp()

    app = try! Application.testable()
    conn = try! app.newConnection(to: .psql).wait()
  }

  func testThatLibrariesReturned() throws {
    let title = "Alexandra"
    let response = try app.sendRequest(to: "/libraries", method: .GET)

    XCTAssertEqual(response.content, "[]")
  }

  override func tearDown() {
    super.tearDown()
    conn.close()
  }
}