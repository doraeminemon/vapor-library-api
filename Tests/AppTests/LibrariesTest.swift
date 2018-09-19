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
    let library = try Library.create(title: title, on: conn)
    let body : EmptyBody? = nil
    let response = try app.sendRequest(to: "/libraries", method: .GET, body: body)
    let content = try response.content
      .decode(Array<Library>.self)
      .wait()

    XCTAssertEqual(content.count, 1)
    XCTAssertEqual(content[0].title, title)
  }

  func testThatLibrariesBooksReturned() throws {
    let lib_title = "Alexandra", book_title = "Odyssey"
    let library = try Library.create(title: lib_title, on: conn)
    let book = try Book.create(title: book_title, library_id: library.id!, on: conn)
    let body : EmptyBody? = nil
    let response = try app.sendRequest(to: "/libraries/\(library.id!)/books",
                                       method: .GET,
                                       body: body)
    let content = try response.content
      .decode(Array<Book>.self)
      .wait()

    content.forEach{ book in
      XCTAssertEqual(book.library_id, library.id!)
    }
    XCTAssertEqual(content.count, 1)
    XCTAssertEqual(content[0].title, book_title)
  }

  override func tearDown() {
    super.tearDown()
    try! conn
      .raw("DELETE FROM \"Book\"")
      .run()
      .wait()
    try! conn
      .raw("DELETE FROM \"Library\"")
      .run()
      .wait()
    conn.close()
  }
}